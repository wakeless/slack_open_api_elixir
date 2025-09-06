defmodule SlackOpenApi.Web.Emoji do
  @moduledoc """
  Provides API endpoint related to emoji
  """

  @default_client SlackOpenApi.Client

  @type emoji_list_200_json_resp :: %{ok: true}

  @type emoji_list_default_json_resp :: %{ok: false}

  @doc """
  get `/emoji.list`

  Lists custom emoji for a team.

  ## Options

    * `token`: Authentication token. Requires scope: `emoji:read`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/emoji.list)

  """
  @spec emoji_list(keyword) :: {:ok, map} | {:error, map}
  def emoji_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Emoji, :emoji_list},
      url: "/emoji.list",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Emoji, :emoji_list_200_json_resp}},
        default: {SlackOpenApi.Web.Emoji, :emoji_list_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:emoji_list_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:emoji_list_default_json_resp) do
    [ok: {:const, false}]
  end
end
