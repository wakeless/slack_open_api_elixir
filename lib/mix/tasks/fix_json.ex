defmodule Mix.Tasks.FixJson do
  @moduledoc """
  Mix task to fix OAuth endpoints in the Slack OpenAPI specification.

  ## Usage

      mix fix_json

  This will modify the oauth.v2.access endpoint to use POST with body parameters
  instead of GET with query parameters, as required by the Slack OAuth API.
  """

  use Mix.Task

  @shortdoc "Fixes OAuth endpoints in the OpenAPI specification"
  @openapi_file_path "lib/slack_web_openapi3.json"

  @impl Mix.Task
  def run(_args) do
    Mix.shell().info("Fixing OAuth endpoints in OpenAPI specification...")
    Mix.shell().info("File: #{@openapi_file_path}")

    case fix_oauth_endpoints() do
      :ok ->
        Mix.shell().info("Successfully fixed OAuth endpoints!")
      {:error, reason} ->
        Mix.shell().error("Failed to fix OAuth endpoints: #{inspect(reason)}")
        System.halt(1)
    end
  end

  defp fix_oauth_endpoints do
    with {:ok, content} <- File.read(@openapi_file_path),
         {:ok, spec} <- Jason.decode(content),
         fixed_spec <- fix_oauth_v2_access(spec),
         {:ok, updated_json} <- Jason.encode(fixed_spec, pretty: true),
         :ok <- File.write(@openapi_file_path, updated_json) do
      :ok
    else
      {:error, reason} -> {:error, reason}
    end
  end

  defp fix_oauth_v2_access(spec) do
    # Update the oauth.v2.access endpoint
    updated_paths = spec
    |> get_in(["paths", "/oauth.v2.access"])
    |> case do
      nil -> 
        Mix.shell().info("oauth.v2.access endpoint not found")
        spec["paths"]
      
      endpoint_spec ->
        Mix.shell().info("Found oauth.v2.access endpoint, converting GET to POST...")
        
        # Extract the GET method definition
        get_method = endpoint_spec["get"]
        
        # Convert query parameters to request body
        post_method = get_method
        |> Map.delete("parameters")
        |> Map.put("requestBody", create_oauth_request_body(get_method["parameters"] || []))
        
        # Create new endpoint spec with POST instead of GET
        new_endpoint_spec = %{
          "post" => post_method
        }
        
        # Update the paths
        spec["paths"]
        |> Map.put("/oauth.v2.access", new_endpoint_spec)
    end

    put_in(spec, ["paths"], updated_paths)
  end

  defp create_oauth_request_body(parameters) do
    # Convert query parameters to form data properties
    properties = parameters
    |> Enum.reduce(%{}, fn param, acc ->
      property_spec = %{
        "type" => get_in(param, ["schema", "type"]) || "string",
        "description" => param["description"]
      }
      
      Map.put(acc, param["name"], property_spec)
    end)

    # Find required parameters
    required = parameters
    |> Enum.filter(fn param -> param["required"] == true end)
    |> Enum.map(fn param -> param["name"] end)

    %{
      "required" => true,
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