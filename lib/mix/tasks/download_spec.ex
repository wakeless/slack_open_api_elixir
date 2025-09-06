defmodule Mix.Tasks.DownloadSpec do
  @moduledoc """
  Mix task to download the Slack OpenAPI specification.

  ## Usage

      mix download_spec

  This will download the Slack Web API OpenAPI specification from
  https://api.slack.com/specs/openapi/v2/slack_web.json and save it
  to lib/slack_web.json
  """

  use Mix.Task

  @shortdoc "Downloads the Slack OpenAPI specification"
  @spec_url "https://api.slack.com/specs/openapi/v2/slack_web.json"
  @swagger_output_path "lib/slack_web.json"
  @openapi_output_path "lib/slack_web_openapi3.json"

  @impl Mix.Task
  def run(_args) do
    Mix.shell().info("Downloading Slack OpenAPI specification...")
    Mix.shell().info("From: #{@spec_url}")
    Mix.shell().info("To: #{@swagger_output_path}")

    # Ensure Req is loaded
    {:ok, _} = Application.ensure_all_started(:req)

    case download_spec() do
      {:ok, content} ->
        case write_spec(content, @swagger_output_path) do
          :ok ->
            Mix.shell().info("Successfully downloaded Swagger 2.0 specification!")
            convert_to_openapi3()
          {:error, reason} ->
            Mix.shell().error("Failed to write file: #{inspect(reason)}")
            System.halt(1)
        end

      {:error, reason} ->
        Mix.shell().error("Failed to download specification: #{inspect(reason)}")
        System.halt(1)
    end
  end

  defp download_spec do
    case Req.get(@spec_url) do
      {:ok, %Req.Response{status: 200, body: body}} ->
        {:ok, body}

      {:ok, %Req.Response{status: status, body: body}} ->
        {:error, "HTTP #{status}: #{body}"}

      {:error, reason} ->
        {:error, reason}
    end
  end

  defp write_spec(content, file_path) do
    # Convert to string if it's a map/struct
    json_content = case content do
      content when is_binary(content) -> content
      content -> Jason.encode!(content, pretty: true)
    end

    case File.write(file_path, json_content) do
      :ok -> :ok
      {:error, reason} -> {:error, reason}
    end
  end

  defp convert_to_openapi3 do
    Mix.shell().info("Converting Swagger 2.0 to OpenAPI 3.0...")
    Mix.shell().info("From: #{@swagger_output_path}")
    Mix.shell().info("To: #{@openapi_output_path}")

    case System.cmd("npx", [
      "swagger2openapi", 
      @swagger_output_path, 
      "-o", @openapi_output_path, 
      "--patch", 
      "--warnOnly"
    ], stderr_to_stdout: true) do
      {_output, 0} ->
        Mix.shell().info("Successfully converted to OpenAPI 3.0!")
        Mix.shell().info("You can now run: mix api.gen default #{@openapi_output_path}")
      
      {output, _exit_code} ->
        Mix.shell().error("Failed to convert specification:")
        Mix.shell().error(output)
        System.halt(1)
    end
  end
end