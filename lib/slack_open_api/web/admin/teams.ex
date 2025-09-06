defmodule SlackOpenApi.Web.Admin.Teams do
  @moduledoc """
  Provides API endpoints related to admin/teams
  """

  @default_client SlackOpenApi.Client

  @type create_200_json_resp :: %{ok: true}

  @type create_default_json_resp :: %{ok: false}

  @doc """
  post `/admin.teams.create`

  Create an Enterprise team.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.teams.create)

  """
  @spec create(map, keyword) :: {:ok, map} | {:error, map}
  def create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin.Teams, :create},
      url: "/admin.teams.create",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Admin.Teams, :create_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.Teams, :create_default_json_resp}
      ],
      opts: opts
    })
  end

  @type list_200_json_resp :: %{ok: true}

  @type list_default_json_resp :: %{ok: false}

  @doc """
  get `/admin.teams.list`

  List all teams on an Enterprise organization

  ## Options

    * `limit`: The maximum number of items to return. Must be between 1 - 100 both inclusive.
    * `cursor`: Set `cursor` to `next_cursor` returned by the previous call to list items in the next page.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.teams.list)

  """
  @spec list(keyword) :: {:ok, map} | {:error, map}
  def list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:cursor, :limit])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Admin.Teams, :list},
      url: "/admin.teams.list",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Admin.Teams, :list_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.Teams, :list_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:create_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:create_default_json_resp) do
    [ok: {:const, false}]
  end

  def __fields__(:list_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:list_default_json_resp) do
    [ok: {:const, false}]
  end
end
