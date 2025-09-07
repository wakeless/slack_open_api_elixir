defmodule Mix.Tasks.FixJson do
  @moduledoc """
  Mix task to fix endpoints in the Slack OpenAPI specification.

  ## Usage

      mix fix_json

  This will modify endpoints that are incorrectly specified as GET but should be POST.
  Any GET endpoint that has "application/json" in its response content types will be
  converted to POST with form data parameters.
  """

  use Mix.Task

  @shortdoc "Fixes endpoints that should be POST instead of GET in the OpenAPI specification"
  @openapi_file_path "lib/slack_web_openapi3.json"

  @impl Mix.Task
  def run(_args) do
    Mix.shell().info("Fixing GET/POST endpoints in OpenAPI specification...")
    Mix.shell().info("File: #{@openapi_file_path}")

    case fix_endpoints_in_file() do
      :ok ->
        Mix.shell().info("Successfully fixed endpoints!")

      {:error, reason} ->
        Mix.shell().error("Failed to fix endpoints: #{inspect(reason)}")
        System.halt(1)
    end
  end

  defp fix_endpoints_in_file do
    with {:ok, content} <- File.read(@openapi_file_path),
         {:ok, spec} <- Jason.decode(content),
         fixed_spec <- fix_endpoints(spec),
         {:ok, updated_json} <- Jason.encode(fixed_spec, pretty: true),
         :ok <- File.write(@openapi_file_path, updated_json) do
      :ok
    else
      {:error, reason} -> {:error, reason}
    end
  end

  def fix_endpoints(spec) do
    updated_paths = 
      spec["paths"]
      |> Enum.reduce(%{}, fn {path, path_spec}, acc ->
        updated_path_spec = fix_path_spec(path, path_spec)
        Map.put(acc, path, updated_path_spec)
      end)

    put_in(spec, ["paths"], updated_paths)
  end

  defp fix_path_spec(path, path_spec) do
    case path_spec do
      %{"get" => get_method} ->
        if should_convert_to_post?(get_method) do
          Mix.shell().info("Converting GET to POST for #{path}")
          convert_get_to_post(path_spec, get_method)
        else
          path_spec
        end

      _ ->
        path_spec
    end
  end

  defp should_convert_to_post?(get_method) do
    get_method
    |> get_in(["responses"])
    |> Enum.any?(fn {_status, response} ->
      response
      |> get_in(["content"])
      |> case do
        nil -> false
        content -> Map.has_key?(content, "application/json")
      end
    end)
  end

  defp convert_get_to_post(path_spec, get_method) do
    # Convert query parameters to request body
    post_method =
      get_method
      |> Map.delete("parameters")
      |> Map.put("requestBody", create_request_body(get_method["parameters"] || []))

    # Remove the GET method and add POST
    path_spec
    |> Map.delete("get")
    |> Map.put("post", post_method)
  end

  defp create_request_body(parameters) do
    # Filter out non-body parameters (like headers)
    body_parameters = 
      parameters
      |> Enum.filter(fn param -> param["in"] != "header" end)

    # Convert query parameters to form data properties
    properties =
      body_parameters
      |> Enum.reduce(%{}, fn param, acc ->
        property_spec = %{
          "type" => get_in(param, ["schema", "type"]) || "string",
          "description" => param["description"]
        }

        Map.put(acc, param["name"], property_spec)
      end)

    # Find required parameters
    required =
      body_parameters
      |> Enum.filter(fn param -> param["required"] == true end)
      |> Enum.map(fn param -> param["name"] end)

    # Create a description that lists all parameters
    param_descriptions =
      body_parameters
      |> Enum.map(fn param ->
        required_marker = if param["required"] == true, do: " (required)", else: ""
        "* `#{param["name"]}`#{required_marker}: #{param["description"]}"
      end)
      |> Enum.join("\n")

    request_body_description =
      if param_descriptions != "" do
        "Request body with the following parameters:\n#{param_descriptions}"
      else
        "Request body"
      end

    %{
      "required" => true,
      "description" => request_body_description,
      "content" => %{
        "application/x-www-form-urlencoded" => %{
          "schema" => %{
            "type" => "object",
            "properties" => properties,
            "required" => required
          }
        }
      }
    }
  end
end
