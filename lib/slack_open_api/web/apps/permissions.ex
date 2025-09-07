defmodule SlackOpenApi.Web.Apps.Permissions do
  @moduledoc """
  Provides API endpoints related to apps/permissions
  """

  @default_client SlackOpenApi.Client

  @type info_200_json_resp :: %{
          info: SlackOpenApi.Web.Apps.Permissions.info_200_json_resp_info(),
          ok: true
        }

  @type info_200_json_resp_info :: %{
          app_home: SlackOpenApi.Web.Apps.Permissions.info_200_json_resp_info_app_home(),
          channel: SlackOpenApi.Web.Apps.Permissions.info_200_json_resp_info_channel(),
          group: SlackOpenApi.Web.Apps.Permissions.info_200_json_resp_info_group(),
          im: SlackOpenApi.Web.Apps.Permissions.info_200_json_resp_info_im(),
          mpim: SlackOpenApi.Web.Apps.Permissions.info_200_json_resp_info_mpim(),
          team: SlackOpenApi.Web.Apps.Permissions.info_200_json_resp_info_team()
        }

  @type info_200_json_resp_info_app_home :: %{
          resources: SlackOpenApi.Web.ObjsResources.t() | nil,
          scopes: [String.t()] | nil
        }

  @type info_200_json_resp_info_channel :: %{
          resources: SlackOpenApi.Web.ObjsResources.t() | nil,
          scopes: [String.t()] | nil
        }

  @type info_200_json_resp_info_group :: %{
          resources: SlackOpenApi.Web.ObjsResources.t() | nil,
          scopes: [String.t()] | nil
        }

  @type info_200_json_resp_info_im :: %{
          resources: SlackOpenApi.Web.ObjsResources.t() | nil,
          scopes: [String.t()] | nil
        }

  @type info_200_json_resp_info_mpim :: %{
          resources: SlackOpenApi.Web.ObjsResources.t() | nil,
          scopes: [String.t()] | nil
        }

  @type info_200_json_resp_info_team :: %{
          resources: SlackOpenApi.Web.ObjsResources.t(),
          scopes: [String.t()]
        }

  @type info_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

  @doc """
  post `/apps.permissions.info`

  Returns list of permissions this app has on a team.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`
    * **Description**: Request body with the following parameters:
      * `token`: Authentication token. Requires scope: `none`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/apps.permissions.info)

  """
  @spec info(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Apps.Permissions.info_200_json_resp()}
          | {:error, SlackOpenApi.Web.Apps.Permissions.info_default_json_resp()}
  def info(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Apps.Permissions, :info},
      url: "/apps.permissions.info",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Apps.Permissions, :info_200_json_resp}},
        default: {SlackOpenApi.Web.Apps.Permissions, :info_default_json_resp}
      ],
      opts: opts
    })
  end

  @type request_200_json_resp :: %{ok: true}

  @type request_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

  @doc """
  post `/apps.permissions.request`

  Allows an app to request additional scopes

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`
    * **Description**: Request body with the following parameters:
      * `token` (required): Authentication token. Requires scope: `none`
      * `scopes` (required): A comma separated list of scopes to request for
      * `trigger_id` (required): Token used to trigger the permissions API

  ## Resources

    * [API method documentation](https://api.slack.com/methods/apps.permissions.request)

  """
  @spec request(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Apps.Permissions.request_200_json_resp()}
          | {:error, SlackOpenApi.Web.Apps.Permissions.request_default_json_resp()}
  def request(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Apps.Permissions, :request},
      url: "/apps.permissions.request",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Apps.Permissions, :request_200_json_resp}},
        default: {SlackOpenApi.Web.Apps.Permissions, :request_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:info_200_json_resp) do
    [info: {SlackOpenApi.Web.Apps.Permissions, :info_200_json_resp_info}, ok: {:const, true}]
  end

  def __fields__(:info_200_json_resp_info) do
    [
      app_home: {SlackOpenApi.Web.Apps.Permissions, :info_200_json_resp_info_app_home},
      channel: {SlackOpenApi.Web.Apps.Permissions, :info_200_json_resp_info_channel},
      group: {SlackOpenApi.Web.Apps.Permissions, :info_200_json_resp_info_group},
      im: {SlackOpenApi.Web.Apps.Permissions, :info_200_json_resp_info_im},
      mpim: {SlackOpenApi.Web.Apps.Permissions, :info_200_json_resp_info_mpim},
      team: {SlackOpenApi.Web.Apps.Permissions, :info_200_json_resp_info_team}
    ]
  end

  def __fields__(:info_200_json_resp_info_app_home) do
    [resources: {SlackOpenApi.Web.ObjsResources, :t}, scopes: [string: :generic]]
  end

  def __fields__(:info_200_json_resp_info_channel) do
    [resources: {SlackOpenApi.Web.ObjsResources, :t}, scopes: [string: :generic]]
  end

  def __fields__(:info_200_json_resp_info_group) do
    [resources: {SlackOpenApi.Web.ObjsResources, :t}, scopes: [string: :generic]]
  end

  def __fields__(:info_200_json_resp_info_im) do
    [resources: {SlackOpenApi.Web.ObjsResources, :t}, scopes: [string: :generic]]
  end

  def __fields__(:info_200_json_resp_info_mpim) do
    [resources: {SlackOpenApi.Web.ObjsResources, :t}, scopes: [string: :generic]]
  end

  def __fields__(:info_200_json_resp_info_team) do
    [resources: {SlackOpenApi.Web.ObjsResources, :t}, scopes: [string: :generic]]
  end

  def __fields__(:info_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
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

  def __fields__(:request_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:request_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "invalid_trigger",
           "trigger_exchanged",
           "invalid_scope",
           "invalid_user",
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
