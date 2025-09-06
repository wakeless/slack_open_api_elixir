defmodule SlackOpenApi.Web.AppsPermissions do
  @moduledoc """
  Provides API endpoints related to apps permissions
  """

  @default_client SlackOpenApi.Client

  @doc """
  get `/apps.permissions.info`

  Returns list of permissions this app has on a team.

  ## Options

    * `token`: Authentication token. Requires scope: `none`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/apps.permissions.info)

  """
  @spec apps_permissions_info(keyword) ::
          {:ok, SlackOpenApi.Web.AppsPermissionsInfoSchema.t()}
          | {:error, SlackOpenApi.Web.AppsPermissionsInfoErrorSchema.t()}
  def apps_permissions_info(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.AppsPermissions, :apps_permissions_info},
      url: "/apps.permissions.info",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.AppsPermissionsInfoSchema, :t}},
        default: {SlackOpenApi.Web.AppsPermissionsInfoErrorSchema, :t}
      ],
      opts: opts
    })
  end

  @doc """
  get `/apps.permissions.request`

  Allows an app to request additional scopes

  ## Options

    * `token`: Authentication token. Requires scope: `none`
    * `scopes`: A comma separated list of scopes to request for
    * `trigger_id`: Token used to trigger the permissions API

  ## Resources

    * [API method documentation](https://api.slack.com/methods/apps.permissions.request)

  """
  @spec apps_permissions_request(keyword) ::
          {:ok, SlackOpenApi.Web.AppsPermissionsRequestSchema.t()}
          | {:error, SlackOpenApi.Web.AppsPermissionsRequestErrorSchema.t()}
  def apps_permissions_request(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:scopes, :token, :trigger_id])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.AppsPermissions, :apps_permissions_request},
      url: "/apps.permissions.request",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.AppsPermissionsRequestSchema, :t}},
        default: {SlackOpenApi.Web.AppsPermissionsRequestErrorSchema, :t}
      ],
      opts: opts
    })
  end
end
