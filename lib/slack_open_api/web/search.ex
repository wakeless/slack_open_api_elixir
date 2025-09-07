defmodule SlackOpenApi.Web.Search do
  @moduledoc """
  Provides API endpoint related to search
  """

  @default_client SlackOpenApi.Client

  @type messages_200_json_resp :: %{ok: true}

  @type messages_default_json_resp :: %{ok: false}

  @doc """
  post `/search.messages`

  Searches for messages matching a query.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`
    * **Description**: Request body with the following parameters:
      * `token` (required): Authentication token. Requires scope: `search:read`
      * `count`: Pass the number of results you want per "page". Maximum of `100`.
      * `highlight`: Pass a value of `true` to enable query highlight markers (see below).
      * `page`: 
      * `query` (required): Search query.
      * `sort`: Return matches sorted by either `score` or `timestamp`.
      * `sort_dir`: Change sort direction to ascending (`asc`) or descending (`desc`).

  ## Resources

    * [API method documentation](https://api.slack.com/methods/search.messages)

  """
  @spec messages(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Search.messages_200_json_resp()}
          | {:error, SlackOpenApi.Web.Search.messages_default_json_resp()}
  def messages(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Search, :messages},
      url: "/search.messages",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Search, :messages_200_json_resp}},
        default: {SlackOpenApi.Web.Search, :messages_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:messages_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:messages_default_json_resp) do
    [ok: {:const, false}]
  end
end
