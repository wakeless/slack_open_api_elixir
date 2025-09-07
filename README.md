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

## Configuration

### Bot Token Setup

To use this library, you'll need a Slack bot token. The library uses clean, snake_case function names generated from the Slack OpenAPI specification.

#### Getting a Bot Token

1. Go to [https://api.slack.com/apps](https://api.slack.com/apps)
2. Create a new app or select an existing one
3. Go to "OAuth & Permissions" in the sidebar
4. Add the required bot token scopes (e.g., `chat:write`, `chat:write.customize`)
5. Install the app to your workspace
6. Copy the "Bot User OAuth Token" (starts with `xoxb-`)

#### Environment Variables

Set your bot token as an environment variable:

```bash
export SLACK_BOT_TOKEN="xoxb-your-bot-token-here"
```

For testing, you can also optionally set:

```bash
export SLACK_TEST_CHANNEL="#your-test-channel"  # defaults to #general
```

## Usage

```elixir
# Send a message
SlackOpenApi.Web.Chat.post_message(%{
  channel: "#general",
  text: "Hello, World!",
  token: System.get_env("SLACK_BOT_TOKEN")
})

# Delete a message
SlackOpenApi.Web.Chat.delete(%{
  channel: "#general", 
  ts: "1234567890.123456",
  token: System.get_env("SLACK_BOT_TOKEN")
})
```

## Function Naming

This library uses a custom processor to provide clean, idiomatic Elixir function names:

- `chat.postMessage` → `Chat.post_message/2`
- `chat.delete` → `Chat.delete/2`  
- `oauth.v2.access` → `Oauth.V2.access/2`
- `admin.apps.approve` → `Admin.Apps.approve/2`
- `admin.apps.approved.list` → `Admin.Apps.Approved.list/1`

## Development

### Generating the API Client

To generate or regenerate the Slack API client from the latest OpenAPI specification:

```bash
mix slack.gen
```

This command will:
1. Download the latest Slack OpenAPI specification
2. Convert it from Swagger 2.0 to OpenAPI 3.0  
3. Fix OAuth endpoints to use POST with body parameters (as required by Slack)
4. Generate the Elixir client code using oapi_generator
5. Compile the generated code to verify everything works

You can also run individual steps:
- `mix download_spec` - Download and convert the OpenAPI spec
- `mix fix_json` - Fix OAuth endpoints in the spec
- `mix api.gen default lib/slack_web_openapi3.json` - Generate client code

**Note:** The oapi_generator currently doesn't extract parameter documentation from requestBody schemas, so POST method parameters won't show individual parameter docs in the generated functions.

## Testing

Run the test suite:

```bash
mix test
```

Run integration tests (requires `SLACK_BOT_TOKEN`):

```bash
export SLACK_BOT_TOKEN="xoxb-your-token"
mix test test/integration/
```

The integration tests will send and immediately delete test messages to verify real API functionality.

