defmodule SlackOpenApi.Web.Dnd do
  @moduledoc """
  Provides API endpoints related to dnd
  """

  @default_client SlackOpenApi.Client

  @type end_dnd_200_json_resp :: %{ok: true}

  @type end_dnd_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

  @doc """
  post `/dnd.endDnd`

  Ends the current user's Do Not Disturb session immediately.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/dnd.endDnd)

  """
  @spec end_dnd(keyword) :: {:ok, map} | {:error, map}
  def end_dnd(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Dnd, :end_dnd},
      url: "/dnd.endDnd",
      method: :post,
      response: [
        {200, {SlackOpenApi.Web.Dnd, :end_dnd_200_json_resp}},
        default: {SlackOpenApi.Web.Dnd, :end_dnd_default_json_resp}
      ],
      opts: opts
    })
  end

  @type end_snooze_200_json_resp :: %{
          dnd_enabled: boolean,
          next_dnd_end_ts: integer,
          next_dnd_start_ts: integer,
          ok: true,
          snooze_enabled: boolean
        }

  @type end_snooze_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  post `/dnd.endSnooze`

  Ends the current user's snooze mode immediately.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/dnd.endSnooze)

  """
  @spec end_snooze(keyword) :: {:ok, map} | {:error, map}
  def end_snooze(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Dnd, :end_snooze},
      url: "/dnd.endSnooze",
      method: :post,
      response: [
        {200, {SlackOpenApi.Web.Dnd, :end_snooze_200_json_resp}},
        default: {SlackOpenApi.Web.Dnd, :end_snooze_default_json_resp}
      ],
      opts: opts
    })
  end

  @type info_200_json_resp :: %{
          dnd_enabled: boolean,
          next_dnd_end_ts: integer,
          next_dnd_start_ts: integer,
          ok: true,
          snooze_enabled: boolean | nil,
          snooze_endtime: integer | nil,
          snooze_remaining: integer | nil
        }

  @type info_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

  @doc """
  get `/dnd.info`

  Retrieves a user's current Do Not Disturb status.

  ## Options

    * `token`: Authentication token. Requires scope: `dnd:read`
    * `user`: User to fetch status for (defaults to current user)

  ## Resources

    * [API method documentation](https://api.slack.com/methods/dnd.info)

  """
  @spec info(keyword) :: {:ok, map} | {:error, map}
  def info(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:token, :user])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Dnd, :info},
      url: "/dnd.info",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Dnd, :info_200_json_resp}},
        default: {SlackOpenApi.Web.Dnd, :info_default_json_resp}
      ],
      opts: opts
    })
  end

  @type set_snooze_200_json_resp :: %{
          ok: true,
          snooze_enabled: boolean,
          snooze_endtime: integer,
          snooze_remaining: integer
        }

  @type set_snooze_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  post `/dnd.setSnooze`

  Turns on Do Not Disturb mode for the current user, or changes its duration.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/dnd.setSnooze)

  """
  @spec set_snooze(map, keyword) :: {:ok, map} | {:error, map}
  def set_snooze(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Dnd, :set_snooze},
      url: "/dnd.setSnooze",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Dnd, :set_snooze_200_json_resp}},
        default: {SlackOpenApi.Web.Dnd, :set_snooze_default_json_resp}
      ],
      opts: opts
    })
  end

  @type team_info_200_json_resp :: %{ok: true}

  @type team_info_default_json_resp :: %{ok: false}

  @doc """
  get `/dnd.teamInfo`

  Retrieves the Do Not Disturb status for up to 50 users on a team.

  ## Options

    * `token`: Authentication token. Requires scope: `dnd:read`
    * `users`: Comma-separated list of users to fetch Do Not Disturb status for

  ## Resources

    * [API method documentation](https://api.slack.com/methods/dnd.teamInfo)

  """
  @spec team_info(keyword) :: {:ok, map} | {:error, map}
  def team_info(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:token, :users])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Dnd, :team_info},
      url: "/dnd.teamInfo",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Dnd, :team_info_200_json_resp}},
        default: {SlackOpenApi.Web.Dnd, :team_info_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:end_dnd_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:end_dnd_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "unknown_error",
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

  def __fields__(:end_snooze_200_json_resp) do
    [
      dnd_enabled: :boolean,
      next_dnd_end_ts: :integer,
      next_dnd_start_ts: :integer,
      ok: {:const, true},
      snooze_enabled: :boolean
    ]
  end

  def __fields__(:end_snooze_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "snooze_end_failed",
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

  def __fields__(:info_200_json_resp) do
    [
      dnd_enabled: :boolean,
      next_dnd_end_ts: :integer,
      next_dnd_start_ts: :integer,
      ok: {:const, true},
      snooze_enabled: :boolean,
      snooze_endtime: :integer,
      snooze_remaining: :integer
    ]
  end

  def __fields__(:info_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "user_not_found",
           "not_authed",
           "invalid_auth",
           "account_inactive",
           "token_revoked",
           "no_permission",
           "org_login_required",
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

  def __fields__(:set_snooze_200_json_resp) do
    [
      ok: {:const, true},
      snooze_enabled: :boolean,
      snooze_endtime: :integer,
      snooze_remaining: :integer
    ]
  end

  def __fields__(:set_snooze_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "missing_duration",
           "snooze_failed",
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
           "too_long",
           "fatal_error"
         ]},
      ok: {:const, false}
    ]
  end

  def __fields__(:team_info_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:team_info_default_json_resp) do
    [ok: {:const, false}]
  end
end
