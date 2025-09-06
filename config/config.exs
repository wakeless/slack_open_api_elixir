import Config

config :oapi_generator, default: [
  output: [
    base_module: SlackOpenApi.Web,
    location: "lib/slack_open_api/web",
    default_client: SlackOpenApi.Client
  ]
]
