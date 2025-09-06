defmodule SlackOpenApi.Web.AppsPermissionsScopes do
  @moduledoc """
  Provides API endpoint related to apps permissions scopes
  """

  @default_client SlackOpenApi.Client

  @doc """
  get `/apps.permissions.scopes.list`

  Returns list of scopes this app has on a team.

  ## Options

    * `token`: Authentication token. Requires scope: `none`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/apps.permissions.scopes.list)

  """
  @spec apps_permissions_scopes_list(keyword) ::
          {:ok, SlackOpenApi.Web.ApiPermissionsScopesListSuccessSchema.t()}
          | {:error, SlackOpenApi.Web.AppsPermissionsScopesListErrorSchema.t()}
  def apps_permissions_scopes_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.AppsPermissionsScopes, :apps_permissions_scopes_list},
      url: "/apps.permissions.scopes.list",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.ApiPermissionsScopesListSuccessSchema, :t}},
        default: {SlackOpenApi.Web.AppsPermissionsScopesListErrorSchema, :t}
      ],
      opts: opts
    })
  end
end
