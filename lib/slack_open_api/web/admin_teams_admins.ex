defmodule SlackOpenApi.Web.AdminTeamsAdmins do
  @moduledoc """
  Provides API endpoint related to admin teams admins
  """

  @default_client SlackOpenApi.Client

  @doc """
  get `/admin.teams.admins.list`

  List all of the admins on a given workspace.

  ## Options

    * `token`: Authentication token. Requires scope: `admin.teams:read`
    * `limit`: The maximum number of items to return.
    * `cursor`: Set `cursor` to `next_cursor` returned by the previous call to list items in the next page.
    * `team_id`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.teams.admins.list)

  """
  @spec admin_teams_admins_list(keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_teams_admins_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:cursor, :limit, :team_id, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.AdminTeamsAdmins, :admin_teams_admins_list},
      url: "/admin.teams.admins.list",
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
