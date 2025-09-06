defmodule SlackOpenApi.Web.Search do
  @moduledoc """
  Provides API endpoint related to search
  """

  @default_client SlackOpenApi.Client

  @type search_messages_200_json_resp :: %{ok: true}

  @type search_messages_default_json_resp :: %{ok: false}

  @doc """
  get `/search.messages`

  Searches for messages matching a query.

  ## Options

    * `token`: Authentication token. Requires scope: `search:read`
    * `count`: Pass the number of results you want per "page". Maximum of `100`.
    * `highlight`: Pass a value of `true` to enable query highlight markers (see below).
    * `page`
    * `query`: Search query.
    * `sort`: Return matches sorted by either `score` or `timestamp`.
    * `sort_dir`: Change sort direction to ascending (`asc`) or descending (`desc`).

  ## Resources

    * [API method documentation](https://api.slack.com/methods/search.messages)

  """
  @spec search_messages(keyword) :: {:ok, map} | {:error, map}
  def search_messages(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:count, :highlight, :page, :query, :sort, :sort_dir, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Search, :search_messages},
      url: "/search.messages",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Search, :search_messages_200_json_resp}},
        default: {SlackOpenApi.Web.Search, :search_messages_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:search_messages_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:search_messages_default_json_resp) do
    [ok: {:const, false}]
  end
end
