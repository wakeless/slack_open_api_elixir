defmodule SlackOpenApi.Web.Apps.Permissions.Scopes do
  @moduledoc """
  Provides API endpoint related to apps/permissions/scopes
  """

  @default_client SlackOpenApi.Client

  @type list_200_json_resp :: %{
          ok: true,
          scopes: SlackOpenApi.Web.Apps.Permissions.Scopes.list_200_json_resp_scopes()
        }

  @type list_200_json_resp_scopes :: %{
          app_home: [String.t()] | nil,
          channel: [String.t()] | nil,
          group: [String.t()] | nil,
          im: [String.t()] | nil,
          mpim: [String.t()] | nil,
          team: [String.t()] | nil,
          user: [String.t()] | nil
        }

  @type list_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

  @doc """
  get `/apps.permissions.scopes.list`

  Returns list of scopes this app has on a team.

  ## Options

    * `token`: Authentication token. Requires scope: `none`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/apps.permissions.scopes.list)

  """
  @spec list(opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Apps.Permissions.Scopes.list_200_json_resp()}
          | {:error, SlackOpenApi.Web.Apps.Permissions.Scopes.list_default_json_resp()}
  def list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Apps.Permissions.Scopes, :list},
      url: "/apps.permissions.scopes.list",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Apps.Permissions.Scopes, :list_200_json_resp}},
        default: {SlackOpenApi.Web.Apps.Permissions.Scopes, :list_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:list_200_json_resp) do
    [
      ok: {:const, true},
      scopes: {SlackOpenApi.Web.Apps.Permissions.Scopes, :list_200_json_resp_scopes}
    ]
  end

  def __fields__(:list_200_json_resp_scopes) do
    [
      app_home: [string: :generic],
      channel: [string: :generic],
      group: [string: :generic],
      im: [string: :generic],
      mpim: [string: :generic],
      team: [string: :generic],
      user: [string: :generic]
    ]
  end

  def __fields__(:list_default_json_resp) do
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
end
