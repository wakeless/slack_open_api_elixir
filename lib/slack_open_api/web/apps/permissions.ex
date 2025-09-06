defmodule SlackOpenApi.Web.Apps.Permissions do
  @moduledoc """
  Provides API endpoints related to apps/permissions
  """

  @default_client SlackOpenApi.Client

  @type info_200_json_resp :: %{
          info: SlackOpenApi.Web.Apps.PermissionsInfo.info_200_json_resp(),
          ok: true
        }

  @type info_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

  @doc """
  get `/apps.permissions.info`

  Returns list of permissions this app has on a team.

  ## Options

    * `token`: Authentication token. Requires scope: `none`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/apps.permissions.info)

  """
  @spec info(keyword) :: {:ok, map} | {:error, map}
  def info(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Apps.Permissions, :info},
      url: "/apps.permissions.info",
      method: :get,
      query: query,
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
  get `/apps.permissions.request`

  Allows an app to request additional scopes

  ## Options

    * `token`: Authentication token. Requires scope: `none`
    * `scopes`: A comma separated list of scopes to request for
    * `trigger_id`: Token used to trigger the permissions API

  ## Resources

    * [API method documentation](https://api.slack.com/methods/apps.permissions.request)

  """
  @spec request(keyword) :: {:ok, map} | {:error, map}
  def request(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:scopes, :token, :trigger_id])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Apps.Permissions, :request},
      url: "/apps.permissions.request",
      method: :get,
      query: query,
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
    [info: {SlackOpenApi.Web.Apps.PermissionsInfo, :info_200_json_resp}, ok: {:const, true}]
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
