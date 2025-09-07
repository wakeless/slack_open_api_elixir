defmodule SlackOpenApi.Web.Reminders do
  @moduledoc """
  Provides API endpoints related to reminders
  """

  @default_client SlackOpenApi.Client

  @type add_200_json_resp :: %{ok: true, reminder: SlackOpenApi.Web.ObjsReminder.t()}

  @type add_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

  @doc """
  post `/reminders.add`

  Creates a reminder.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/reminders.add)

  """
  @spec add(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Reminders.add_200_json_resp()}
          | {:error, SlackOpenApi.Web.Reminders.add_default_json_resp()}
  def add(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Reminders, :add},
      url: "/reminders.add",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Reminders, :add_200_json_resp}},
        default: {SlackOpenApi.Web.Reminders, :add_default_json_resp}
      ],
      opts: opts
    })
  end

  @type complete_200_json_resp :: %{ok: true}

  @type complete_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

  @doc """
  post `/reminders.complete`

  Marks a reminder as complete.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/reminders.complete)

  """
  @spec complete(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Reminders.complete_200_json_resp()}
          | {:error, SlackOpenApi.Web.Reminders.complete_default_json_resp()}
  def complete(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Reminders, :complete},
      url: "/reminders.complete",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Reminders, :complete_200_json_resp}},
        default: {SlackOpenApi.Web.Reminders, :complete_default_json_resp}
      ],
      opts: opts
    })
  end

  @type delete_200_json_resp :: %{ok: true}

  @type delete_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

  @doc """
  post `/reminders.delete`

  Deletes a reminder.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/reminders.delete)

  """
  @spec delete(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Reminders.delete_200_json_resp()}
          | {:error, SlackOpenApi.Web.Reminders.delete_default_json_resp()}
  def delete(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Reminders, :delete},
      url: "/reminders.delete",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Reminders, :delete_200_json_resp}},
        default: {SlackOpenApi.Web.Reminders, :delete_default_json_resp}
      ],
      opts: opts
    })
  end

  @type info_200_json_resp :: %{ok: true, reminder: SlackOpenApi.Web.ObjsReminder.t()}

  @type info_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

  @doc """
  get `/reminders.info`

  Gets information about a reminder.

  ## Options

    * `token`: Authentication token. Requires scope: `reminders:read`
    * `reminder`: The ID of the reminder

  ## Resources

    * [API method documentation](https://api.slack.com/methods/reminders.info)

  """
  @spec info(opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Reminders.info_200_json_resp()}
          | {:error, SlackOpenApi.Web.Reminders.info_default_json_resp()}
  def info(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:reminder, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Reminders, :info},
      url: "/reminders.info",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Reminders, :info_200_json_resp}},
        default: {SlackOpenApi.Web.Reminders, :info_default_json_resp}
      ],
      opts: opts
    })
  end

  @type list_200_json_resp :: %{ok: true, reminders: [SlackOpenApi.Web.ObjsReminder.t()]}

  @type list_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

  @doc """
  get `/reminders.list`

  Lists all reminders created by or for a given user.

  ## Options

    * `token`: Authentication token. Requires scope: `reminders:read`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/reminders.list)

  """
  @spec list(opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Reminders.list_200_json_resp()}
          | {:error, SlackOpenApi.Web.Reminders.list_default_json_resp()}
  def list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Reminders, :list},
      url: "/reminders.list",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Reminders, :list_200_json_resp}},
        default: {SlackOpenApi.Web.Reminders, :list_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:add_200_json_resp) do
    [ok: {:const, true}, reminder: {SlackOpenApi.Web.ObjsReminder, :t}]
  end

  def __fields__(:add_default_json_resp) do
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

  def __fields__(:complete_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:complete_default_json_resp) do
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

  def __fields__(:delete_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:delete_default_json_resp) do
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

  def __fields__(:info_200_json_resp) do
    [ok: {:const, true}, reminder: {SlackOpenApi.Web.ObjsReminder, :t}]
  end

  def __fields__(:info_default_json_resp) do
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

  def __fields__(:list_200_json_resp) do
    [ok: {:const, true}, reminders: [{SlackOpenApi.Web.ObjsReminder, :t}]]
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
