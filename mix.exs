defmodule SlackOpenApi.MixProject do
  use Mix.Project

  @version "0.0.3"
  @source_url "https://github.com/wakeless/slack_open_api_elixir"

  def project do
    [
      app: :slack_open_api,
      description: "A Slack Open API client",
      version: @version,
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      source_url: @source_url,
      homepage_url: @source_url,
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      links: %{
         "API Documentation" => "https://docs.slack.dev/apis/web-api/",
         "Github" => "https://github.com/wakeless/slack_open_api_elixir",
         "Reference implementation" => "https://pipie.io"
      }
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:oapi_generator, "~> 0.2.0", only: [:dev, :test], runtime: false},
      {:req, "~> 0.5.0"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end
end
