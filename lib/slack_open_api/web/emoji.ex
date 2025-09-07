defmodule SlackOpenApi.Web.Emoji do
  @moduledoc """
  Provides API endpoint related to emoji
  """

  @default_client SlackOpenApi.Client

  @type list_200_json_resp :: %{ok: true}

  @type list_default_json_resp :: %{ok: false}

  @doc """
  post `/emoji.list`

  Lists custom emoji for a team.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`
    * **Description**: Request body with the following parameters:
      * `token` (required): Authentication token. Requires scope: `emoji:read`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/emoji.list)

  """
  @spec list(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Emoji.list_200_json_resp()}
          | {:error, SlackOpenApi.Web.Emoji.list_default_json_resp()}
  def list(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Emoji, :list},
      url: "/emoji.list",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
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
