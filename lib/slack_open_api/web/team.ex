defmodule SlackOpenApi.Web.Team do
  @moduledoc """
  Provides API endpoints related to team
  """

  @default_client SlackOpenApi.Client

  @type access_logs_200_json_resp :: %{
          logins: [SlackOpenApi.Web.Team.access_logs_200_json_resp_logins()],
          ok: true,
          paging: SlackOpenApi.Web.ObjsPaging.t()
        }

  @type access_logs_200_json_resp_logins :: %{
          count: integer,
          country: String.t() | nil,
          date_first: integer,
          date_last: integer,
          ip: String.t() | nil,
          isp: String.t() | nil,
          region: String.t() | nil,
          user_agent: String.t(),
          user_id: String.t(),
          username: String.t()
        }

  @type access_logs_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  get `/team.accessLogs`

  Gets the access logs for the current team.

  ## Options

    * `token`: Authentication token. Requires scope: `admin`
    * `before`: End of time range of logs to include in results (inclusive).
    * `count`
    * `page`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/team.accessLogs)

  """
  @spec access_logs(opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Team.access_logs_200_json_resp()}
          | {:error, SlackOpenApi.Web.Team.access_logs_default_json_resp()}
  def access_logs(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:before, :count, :page, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Team, :access_logs},
      url: "/team.accessLogs",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Team, :access_logs_200_json_resp}},
        default: {SlackOpenApi.Web.Team, :access_logs_default_json_resp}
      ],
      opts: opts
    })
  end

  @type billable_info_200_json_resp :: %{ok: true}

  @type billable_info_default_json_resp :: %{ok: false}

  @doc """
  get `/team.billableInfo`

  Gets billable users information for the current team.

  ## Options

    * `token`: Authentication token. Requires scope: `admin`
    * `user`: A user to retrieve the billable information for. Defaults to all users.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/team.billableInfo)

  """
  @spec billable_info(opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Team.billable_info_200_json_resp()}
          | {:error, SlackOpenApi.Web.Team.billable_info_default_json_resp()}
  def billable_info(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:token, :user])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Team, :billable_info},
      url: "/team.billableInfo",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Team, :billable_info_200_json_resp}},
        default: {SlackOpenApi.Web.Team, :billable_info_default_json_resp}
      ],
      opts: opts
    })
  end

  @type info_200_json_resp :: %{ok: true, team: SlackOpenApi.Web.ObjsTeam.t()}

  @type info_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

  @doc """
  get `/team.info`

  Gets information about the current team.

  ## Options

    * `token`: Authentication token. Requires scope: `team:read`
    * `team`: Team to get info on, if omitted, will return information about the current team. Team to get info about; if omitted, will return information about the current team.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/team.info)

  """
  @spec info(opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Team.info_200_json_resp()}
          | {:error, SlackOpenApi.Web.Team.info_default_json_resp()}
  def info(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:team, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Team, :info},
      url: "/team.info",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Team, :info_200_json_resp}},
        default: {SlackOpenApi.Web.Team, :info_default_json_resp}
      ],
      opts: opts
    })
  end

  @type integration_logs_200_json_resp :: %{
          logs: [SlackOpenApi.Web.Team.integration_logs_200_json_resp_logs()],
          ok: true,
          paging: SlackOpenApi.Web.ObjsPaging.t()
        }

  @type integration_logs_200_json_resp_logs :: %{
          admin_app_id: String.t() | nil,
          app_id: String.t(),
          app_type: String.t(),
          change_type: String.t(),
          channel: String.t() | nil,
          date: String.t(),
          scope: String.t(),
          service_id: String.t() | nil,
          service_type: String.t() | nil,
          user_id: String.t(),
          user_name: String.t()
        }

  @type integration_logs_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  get `/team.integrationLogs`

  Gets the integration logs for the current team.

  ## Options

    * `token`: Authentication token. Requires scope: `admin`
    * `app_id`: Filter logs to this Slack app. Defaults to all logs.
    * `change_type`: Filter logs with this change type. Defaults to all logs.
    * `count`
    * `page`
    * `service_id`: Filter logs to this service. Defaults to all logs.
    * `user`: Filter logs generated by this user’s actions. Defaults to all logs.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/team.integrationLogs)

  """
  @spec integration_logs(opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Team.integration_logs_200_json_resp()}
          | {:error, SlackOpenApi.Web.Team.integration_logs_default_json_resp()}
  def integration_logs(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:app_id, :change_type, :count, :page, :service_id, :token, :user])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Team, :integration_logs},
      url: "/team.integrationLogs",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Team, :integration_logs_200_json_resp}},
        default: {SlackOpenApi.Web.Team, :integration_logs_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:access_logs_200_json_resp) do
    [
      logins: [{SlackOpenApi.Web.Team, :access_logs_200_json_resp_logins}],
      ok: {:const, true},
      paging: {SlackOpenApi.Web.ObjsPaging, :t}
    ]
  end

  def __fields__(:access_logs_200_json_resp_logins) do
    [
      count: :integer,
      country: {:string, :generic},
      date_first: :integer,
      date_last: :integer,
      ip: {:string, :generic},
      isp: {:string, :generic},
      region: {:string, :generic},
      user_agent: {:string, :generic},
      user_id: {:string, :generic},
      username: {:string, :generic}
    ]
  end

  def __fields__(:access_logs_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "paid_only",
           "over_pagination_limit",
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

  def __fields__(:billable_info_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:billable_info_default_json_resp) do
    [ok: {:const, false}]
  end

  def __fields__(:info_200_json_resp) do
    [ok: {:const, true}, team: {SlackOpenApi.Web.ObjsTeam, :t}]
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

  def __fields__(:integration_logs_200_json_resp) do
    [
      logs: [{SlackOpenApi.Web.Team, :integration_logs_200_json_resp_logs}],
      ok: {:const, true},
      paging: {SlackOpenApi.Web.ObjsPaging, :t}
    ]
  end

  def __fields__(:integration_logs_200_json_resp_logs) do
    [
      admin_app_id: {:string, :generic},
      app_id: {:string, :generic},
      app_type: {:string, :generic},
      change_type: {:string, :generic},
      channel: {:string, :generic},
      date: {:string, :generic},
      scope: {:string, :generic},
      service_id: {:string, :generic},
      service_type: {:string, :generic},
      user_id: {:string, :generic},
      user_name: {:string, :generic}
    ]
  end

  def __fields__(:integration_logs_default_json_resp) do
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
