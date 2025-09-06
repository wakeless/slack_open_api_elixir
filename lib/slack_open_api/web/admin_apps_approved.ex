defmodule SlackOpenApi.Web.AdminAppsApproved do
  @moduledoc """
  Provides API endpoint related to admin apps approved
  """

  @default_client SlackOpenApi.Client

  @doc """
  get `/admin.apps.approved.list`

  List approved apps for an org or workspace.

  ## Options

    * `token`: Authentication token. Requires scope: `admin.apps:read`
    * `limit`: The maximum number of items to return. Must be between 1 - 1000 both inclusive.
    * `cursor`: Set `cursor` to `next_cursor` returned by the previous call to list items in the next page
    * `team_id`
    * `enterprise_id`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.apps.approved.list)

  """
  @spec admin_apps_approved_list(keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_apps_approved_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:cursor, :enterprise_id, :limit, :team_id, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.AdminAppsApproved, :admin_apps_approved_list},
      url: "/admin.apps.approved.list",
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
