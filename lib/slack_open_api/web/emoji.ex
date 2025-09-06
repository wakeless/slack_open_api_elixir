defmodule SlackOpenApi.Web.Emoji do
  @moduledoc """
  Provides API endpoint related to emoji
  """

  @default_client SlackOpenApi.Client

  @type list_200_json_resp :: %{ok: true}

  @type list_default_json_resp :: %{ok: false}

  @doc """
  get `/emoji.list`

  Lists custom emoji for a team.

  ## Options

    * `token`: Authentication token. Requires scope: `emoji:read`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/emoji.list)

  """
  @spec list(keyword) :: {:ok, map} | {:error, map}
  def list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Emoji, :list},
      url: "/emoji.list",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Emoji, :list_200_json_resp}},
        default: {SlackOpenApi.Web.Emoji, :list_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:list_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:list_default_json_resp) do
    [ok: {:const, false}]
  end
end
