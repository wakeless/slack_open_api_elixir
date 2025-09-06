# SlackOpenApi

An Elixir library for Slack API integration, built using OpenAPI code generation.

This project is inspired by [BlakeWilliams/Elixir-Slack](https://github.com/BlakeWilliams/Elixir-Slack), which approach was outdated based on current availability. It utilizes the `oapi_generator` and the OpenAPI specifications that are now available from Slack.

This library powers [pipio.io – a GitLab and Slack integration](https://pipio.io).

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `slack_open_api` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:slack_open_api, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/slack_open_api>.

