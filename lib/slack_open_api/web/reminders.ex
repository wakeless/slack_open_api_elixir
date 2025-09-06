defmodule SlackOpenApi.Web.Reminders do
  @moduledoc """
  Provides API endpoints related to reminders
  """

  @default_client SlackOpenApi.Client

  @type reminders_add_200_json_resp :: %{ok: true, reminder: SlackOpenApi.Web.ObjsReminder.t()}

  @type reminders_add_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  post `/reminders.add`

  Creates a reminder.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/reminders.add)

  """
  @spec reminders_add(map, keyword) :: {:ok, map} | {:error, map}
  def reminders_add(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Reminders, :reminders_add},
      url: "/reminders.add",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Reminders, :reminders_add_200_json_resp}},
        default: {SlackOpenApi.Web.Reminders, :reminders_add_default_json_resp}
      ],
      opts: opts
    })
  end

  @type reminders_complete_200_json_resp :: %{ok: true}

  @type reminders_complete_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  post `/reminders.complete`

  Marks a reminder as complete.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/reminders.complete)

  """
  @spec reminders_complete(map, keyword) :: {:ok, map} | {:error, map}
  def reminders_complete(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Reminders, :reminders_complete},
      url: "/reminders.complete",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Reminders, :reminders_complete_200_json_resp}},
        default: {SlackOpenApi.Web.Reminders, :reminders_complete_default_json_resp}
      ],
      opts: opts
    })
  end

  @type reminders_delete_200_json_resp :: %{ok: true}

  @type reminders_delete_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  post `/reminders.delete`

  Deletes a reminder.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/reminders.delete)

  """
  @spec reminders_delete(map, keyword) :: {:ok, map} | {:error, map}
  def reminders_delete(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Reminders, :reminders_delete},
      url: "/reminders.delete",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Reminders, :reminders_delete_200_json_resp}},
        default: {SlackOpenApi.Web.Reminders, :reminders_delete_default_json_resp}
      ],
      opts: opts
    })
  end

  @type reminders_info_200_json_resp :: %{ok: true, reminder: SlackOpenApi.Web.ObjsReminder.t()}

  @type reminders_info_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  get `/reminders.info`

  Gets information about a reminder.

  ## Options

    * `token`: Authentication token. Requires scope: `reminders:read`
    * `reminder`: The ID of the reminder

  ## Resources

    * [API method documentation](https://api.slack.com/methods/reminders.info)

  """
  @spec reminders_info(keyword) :: {:ok, map} | {:error, map}
  def reminders_info(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:reminder, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Reminders, :reminders_info},
      url: "/reminders.info",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Reminders, :reminders_info_200_json_resp}},
        default: {SlackOpenApi.Web.Reminders, :reminders_info_default_json_resp}
      ],
      opts: opts
    })
  end

  @type reminders_list_200_json_resp :: %{
          ok: true,
          reminders: [SlackOpenApi.Web.ObjsReminder.t()]
        }

  @type reminders_list_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  get `/reminders.list`

  Lists all reminders created by or for a given user.

  ## Options

    * `token`: Authentication token. Requires scope: `reminders:read`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/reminders.list)

  """
  @spec reminders_list(keyword) :: {:ok, map} | {:error, map}
  def reminders_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Reminders, :reminders_list},
      url: "/reminders.list",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Reminders, :reminders_list_200_json_resp}},
        default: {SlackOpenApi.Web.Reminders, :reminders_list_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:reminders_add_200_json_resp) do
    [ok: {:const, true}, reminder: {SlackOpenApi.Web.ObjsReminder, :t}]
  end

  def __fields__(:reminders_add_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "cannot_parse",
           "user_not_found",
           "cannot_add_bot",
           "cannot_add_slackbot",
           "cannot_add_others",
           "cannot_add_others_recurring",
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

  def __fields__(:reminders_complete_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:reminders_complete_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "not_found",
           "cannot_complete_recurring",
           "cannot_complete_others",
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

  def __fields__(:reminders_delete_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:reminders_delete_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "not_found",
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

  def __fields__(:reminders_info_200_json_resp) do
    [ok: {:const, true}, reminder: {SlackOpenApi.Web.ObjsReminder, :t}]
  end

  def __fields__(:reminders_info_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "not_found",
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

  def __fields__(:reminders_list_200_json_resp) do
    [ok: {:const, true}, reminders: [{SlackOpenApi.Web.ObjsReminder, :t}]]
  end

  def __fields__(:reminders_list_default_json_resp) do
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
