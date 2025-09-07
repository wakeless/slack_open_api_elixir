defmodule Mix.Tasks.Slack.Gen do
  @moduledoc """
  Mix task to download, fix, and generate the Slack API client in one command.

  ## Usage

      mix slack.gen

  This task performs the following steps:
  1. Downloads the Slack OpenAPI specification
  2. Converts it from Swagger 2.0 to OpenAPI 3.0
  3. Fixes OAuth endpoints to use POST with body parameters
  4. Generates the Elixir client code using oapi_generator
  """

  use Mix.Task

  @shortdoc "Downloads and generates the complete Slack API client"

  @impl Mix.Task
  def run(_args) do
    Mix.shell().info("Starting Slack API client generation...")
    Mix.shell().info("=" |> String.duplicate(50))
    
    # Step 1: Download the specification
    Mix.shell().info("\n[1/4] Downloading Slack OpenAPI specification...")
    Mix.Task.run("download_spec", [])
    
    # Step 2: Fix the OAuth endpoints
    Mix.shell().info("\n[2/4] Fixing OAuth endpoints...")
    Mix.Task.run("fix_json", [])
    
    # Step 3: Generate the API client code
    Mix.shell().info("\n[3/4] Generating Elixir client code...")
    Mix.Task.run("api.gen", ["default", "lib/slack_web_openapi3.json"])
    
    # Step 4: Compile to verify everything works
    Mix.shell().info("\n[4/4] Compiling generated code...")
    Mix.Task.run("compile", ["--force"])
    
    Mix.shell().info("\n" <> "=" |> String.duplicate(50))
    Mix.shell().info("✅ Slack API client successfully generated!")
    Mix.shell().info("\nYou can now use the Slack API client in your application.")
    Mix.shell().info("Example: SlackOpenApi.Web.Chat.post_message(%{channel: \"C1234567890\", text: \"Hello!\"}, token: \"xoxb-...\")")
  end
end