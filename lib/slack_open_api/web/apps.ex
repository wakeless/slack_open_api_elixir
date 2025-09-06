defmodule SlackOpenApi.Web.Apps do
  @moduledoc """
  Provides API endpoints related to apps
  """

  @default_client SlackOpenApi.Client

  @doc """
  get `/apps.event.authorizations.list`

  Get a list of authorizations for the given event context. Each authorization represents an app installation that the event is visible to.

  ## Options

    * `event_context`
    * `cursor`
    * `limit`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/apps.event.authorizations.list)

  """
  @spec apps_event_authorizations_list(keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def apps_event_authorizations_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:cursor, :event_context, :limit])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Apps, :apps_event_authorizations_list},
      url: "/apps.event.authorizations.list",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.DefaultSuccessTemplate, :t}},
        default: {SlackOpenApi.Web.DefaultErrorTemplate, :t}
      ],
      opts: opts
    })
  end

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
      call: {SlackOpenApi.Web.Apps, :apps_permissions_info},
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
      call: {SlackOpenApi.Web.Apps, :apps_permissions_request},
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

  @doc """
  get `/apps.permissions.resources.list`

  Returns list of resource grants this app has on a team.

  ## Options

    * `token`: Authentication token. Requires scope: `none`
    * `cursor`: Paginate through collections of data by setting the `cursor` parameter to a `next_cursor` attribute returned by a previous request's `response_metadata`. Default value fetches the first "page" of the collection. See [pagination](/docs/pagination) for more detail.
    * `limit`: The maximum number of items to return.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/apps.permissions.resources.list)

  """
  @spec apps_permissions_resources_list(keyword) ::
          {:ok, SlackOpenApi.Web.AppsPermissionsResourcesListSuccessSchema.t()}
          | {:error, SlackOpenApi.Web.AppsPermissionsResourcesListErrorSchema.t()}
  def apps_permissions_resources_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:cursor, :limit, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Apps, :apps_permissions_resources_list},
      url: "/apps.permissions.resources.list",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.AppsPermissionsResourcesListSuccessSchema, :t}},
        default: {SlackOpenApi.Web.AppsPermissionsResourcesListErrorSchema, :t}
      ],
      opts: opts
    })
  end

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
      call: {SlackOpenApi.Web.Apps, :apps_permissions_scopes_list},
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

  @type apps_uninstall_200_json_resp :: %{ok: true}

  @type apps_uninstall_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  get `/apps.uninstall`

  Uninstalls your app from a workspace.

  ## Options

    * `token`: Authentication token. Requires scope: `none`
    * `client_id`: Issued when you created your application.
    * `client_secret`: Issued when you created your application.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/apps.uninstall)

  """
  @spec apps_uninstall(keyword) :: {:ok, map} | {:error, map}
  def apps_uninstall(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:client_id, :client_secret, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Apps, :apps_uninstall},
      url: "/apps.uninstall",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Apps, :apps_uninstall_200_json_resp}},
        default: {SlackOpenApi.Web.Apps, :apps_uninstall_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:apps_uninstall_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:apps_uninstall_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "invalid_client_id",
           "bad_client_secret",
           "client_id_token_mismatch",
           "not_authed",
           "invalid_auth",
           "account_inactive",
           "token_revoked",
           "no_permission",
           "org_login_required",
           "user_is_bot",
           "invalid_arg_name",
           "invalid_array_arg",
           "invalid_charset",
           "invalid_form_data",
           "invalid_post_type",
           "missing_post_type",
           "team_added_to_org",
           "invalid_json",
           "json_not_object",
           "request_timeout",
           "upgrade_required",
           "fatal_error"
         ]},
      ok: {:const, false}
    ]
  end
end
