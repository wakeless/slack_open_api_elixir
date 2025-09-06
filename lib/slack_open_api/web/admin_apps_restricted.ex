defmodule SlackOpenApi.Web.AdminAppsRestricted do
  @moduledoc """
  Provides API endpoint related to admin apps restricted
  """

  @default_client SlackOpenApi.Client

  @doc """
  get `/admin.apps.restricted.list`

  List restricted apps for an org or workspace.

  ## Options

    * `token`: Authentication token. Requires scope: `admin.apps:read`
    * `limit`: The maximum number of items to return. Must be between 1 - 1000 both inclusive.
    * `cursor`: Set `cursor` to `next_cursor` returned by the previous call to list items in the next page
    * `team_id`
    * `enterprise_id`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.apps.restricted.list)

  """
  @spec admin_apps_restricted_list(keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_apps_restricted_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:cursor, :enterprise_id, :limit, :team_id, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.AdminAppsRestricted, :admin_apps_restricted_list},
      url: "/admin.apps.restricted.list",
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
