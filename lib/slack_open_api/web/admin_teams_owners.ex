defmodule SlackOpenApi.Web.AdminTeamsOwners do
  @moduledoc """
  Provides API endpoint related to admin teams owners
  """

  @default_client SlackOpenApi.Client

  @doc """
  get `/admin.teams.owners.list`

  List all of the owners on a given workspace.

  ## Options

    * `token`: Authentication token. Requires scope: `admin.teams:read`
    * `team_id`
    * `limit`: The maximum number of items to return. Must be between 1 - 1000 both inclusive.
    * `cursor`: Set `cursor` to `next_cursor` returned by the previous call to list items in the next page.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.teams.owners.list)

  """
  @spec admin_teams_owners_list(keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_teams_owners_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:cursor, :limit, :team_id, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.AdminTeamsOwners, :admin_teams_owners_list},
      url: "/admin.teams.owners.list",
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
