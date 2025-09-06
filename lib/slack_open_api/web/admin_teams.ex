defmodule SlackOpenApi.Web.AdminTeams do
  @moduledoc """
  Provides API endpoints related to admin teams
  """

  @default_client SlackOpenApi.Client

  @doc """
  post `/admin.teams.create`

  Create an Enterprise team.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.teams.create)

  """
  @spec admin_teams_create(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_teams_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.AdminTeams, :admin_teams_create},
      url: "/admin.teams.create",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.DefaultSuccessTemplate, :t}},
        default: {SlackOpenApi.Web.DefaultErrorTemplate, :t}
      ],
      opts: opts
    })
  end

  @doc """
  get `/admin.teams.list`

  List all teams on an Enterprise organization

  ## Options

    * `limit`: The maximum number of items to return. Must be between 1 - 100 both inclusive.
    * `cursor`: Set `cursor` to `next_cursor` returned by the previous call to list items in the next page.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.teams.list)

  """
  @spec admin_teams_list(keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_teams_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:cursor, :limit])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.AdminTeams, :admin_teams_list},
      url: "/admin.teams.list",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.DefaultSuccessTemplate, :t}},
        default: {SlackOpenApi.Web.DefaultErrorTemplate, :t}
      ],
      opts: opts
    })
  end
end
