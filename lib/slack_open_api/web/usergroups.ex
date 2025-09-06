defmodule SlackOpenApi.Web.Usergroups do
  @moduledoc """
  Provides API endpoints related to usergroups
  """

  @default_client SlackOpenApi.Client

  @type usergroups_create_200_json_resp :: %{
          ok: true,
          usergroup: SlackOpenApi.Web.ObjsSubteam.t()
        }

  @type usergroups_create_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  post `/usergroups.create`

  Create a User Group

  ## Resources

    * [API method documentation](https://api.slack.com/methods/usergroups.create)

  """
  @spec usergroups_create(map, keyword) :: {:ok, map} | {:error, map}
  def usergroups_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Usergroups, :usergroups_create},
      url: "/usergroups.create",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Usergroups, :usergroups_create_200_json_resp}},
        default: {SlackOpenApi.Web.Usergroups, :usergroups_create_default_json_resp}
      ],
      opts: opts
    })
  end

  @type usergroups_disable_200_json_resp :: %{
          ok: true,
          usergroup: SlackOpenApi.Web.ObjsSubteam.t()
        }

  @type usergroups_disable_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  post `/usergroups.disable`

  Disable an existing User Group

  ## Resources

    * [API method documentation](https://api.slack.com/methods/usergroups.disable)

  """
  @spec usergroups_disable(map, keyword) :: {:ok, map} | {:error, map}
  def usergroups_disable(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Usergroups, :usergroups_disable},
      url: "/usergroups.disable",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Usergroups, :usergroups_disable_200_json_resp}},
        default: {SlackOpenApi.Web.Usergroups, :usergroups_disable_default_json_resp}
      ],
      opts: opts
    })
  end

  @type usergroups_enable_200_json_resp :: %{
          ok: true,
          usergroup: SlackOpenApi.Web.ObjsSubteam.t()
        }

  @type usergroups_enable_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  post `/usergroups.enable`

  Enable a User Group

  ## Resources

    * [API method documentation](https://api.slack.com/methods/usergroups.enable)

  """
  @spec usergroups_enable(map, keyword) :: {:ok, map} | {:error, map}
  def usergroups_enable(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Usergroups, :usergroups_enable},
      url: "/usergroups.enable",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Usergroups, :usergroups_enable_200_json_resp}},
        default: {SlackOpenApi.Web.Usergroups, :usergroups_enable_default_json_resp}
      ],
      opts: opts
    })
  end

  @type usergroups_list_200_json_resp :: %{
          ok: true,
          usergroups: [SlackOpenApi.Web.ObjsSubteam.t()]
        }

  @type usergroups_list_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  get `/usergroups.list`

  List all User Groups for a team

  ## Options

    * `include_users`: Include the list of users for each User Group.
    * `token`: Authentication token. Requires scope: `usergroups:read`
    * `include_count`: Include the number of users in each User Group.
    * `include_disabled`: Include disabled User Groups.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/usergroups.list)

  """
  @spec usergroups_list(keyword) :: {:ok, map} | {:error, map}
  def usergroups_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:include_count, :include_disabled, :include_users, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Usergroups, :usergroups_list},
      url: "/usergroups.list",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Usergroups, :usergroups_list_200_json_resp}},
        default: {SlackOpenApi.Web.Usergroups, :usergroups_list_default_json_resp}
      ],
      opts: opts
    })
  end

  @type usergroups_update_200_json_resp :: %{
          ok: true,
          usergroup: SlackOpenApi.Web.ObjsSubteam.t()
        }

  @type usergroups_update_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  post `/usergroups.update`

  Update an existing User Group

  ## Resources

    * [API method documentation](https://api.slack.com/methods/usergroups.update)

  """
  @spec usergroups_update(map, keyword) :: {:ok, map} | {:error, map}
  def usergroups_update(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Usergroups, :usergroups_update},
      url: "/usergroups.update",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Usergroups, :usergroups_update_200_json_resp}},
        default: {SlackOpenApi.Web.Usergroups, :usergroups_update_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc """
  get `/usergroups.users.list`

  List all users in a User Group

  ## Options

    * `token`: Authentication token. Requires scope: `usergroups:read`
    * `include_disabled`: Allow results that involve disabled User Groups.
    * `usergroup`: The encoded ID of the User Group to update.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/usergroups.users.list)

  """
  @spec usergroups_users_list(keyword) ::
          {:ok, SlackOpenApi.Web.UsergroupsUsersListSchema.t()}
          | {:error, SlackOpenApi.Web.UsergroupsUsersListErrorSchema.t()}
  def usergroups_users_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:include_disabled, :token, :usergroup])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Usergroups, :usergroups_users_list},
      url: "/usergroups.users.list",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.UsergroupsUsersListSchema, :t}},
        default: {SlackOpenApi.Web.UsergroupsUsersListErrorSchema, :t}
      ],
      opts: opts
    })
  end

  @doc """
  post `/usergroups.users.update`

  Update the list of users for a User Group

  ## Resources

    * [API method documentation](https://api.slack.com/methods/usergroups.users.update)

  """
  @spec usergroups_users_update(map, keyword) ::
          {:ok, SlackOpenApi.Web.UsergroupsUsersUpdateSchema.t()}
          | {:error, SlackOpenApi.Web.UsergroupsUsersUpdateErrorSchema.t()}
  def usergroups_users_update(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Usergroups, :usergroups_users_update},
      url: "/usergroups.users.update",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.UsergroupsUsersUpdateSchema, :t}},
        default: {SlackOpenApi.Web.UsergroupsUsersUpdateErrorSchema, :t}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:usergroups_create_200_json_resp) do
    [ok: {:const, true}, usergroup: {SlackOpenApi.Web.ObjsSubteam, :t}]
  end

  def __fields__(:usergroups_create_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "permission_denied",
           "not_authed",
           "invalid_auth",
           "account_inactive",
           "token_revoked",
           "no_permission",
           "org_login_required",
           "user_is_bot",
           "user_is_restricted",
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

  def __fields__(:usergroups_disable_200_json_resp) do
    [ok: {:const, true}, usergroup: {SlackOpenApi.Web.ObjsSubteam, :t}]
  end

  def __fields__(:usergroups_disable_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "permission_denied",
           "not_authed",
           "invalid_auth",
           "account_inactive",
           "token_revoked",
           "no_permission",
           "org_login_required",
           "user_is_bot",
           "user_is_restricted",
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

  def __fields__(:usergroups_enable_200_json_resp) do
    [ok: {:const, true}, usergroup: {SlackOpenApi.Web.ObjsSubteam, :t}]
  end

  def __fields__(:usergroups_enable_default_json_resp) do
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
           "user_is_restricted",
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
           "upgrade_require",
           "fatal_error",
           "missing_charset",
           "superfluous_charset"
         ]},
      ok: {:const, false}
    ]
  end

  def __fields__(:usergroups_list_200_json_resp) do
    [ok: {:const, true}, usergroups: [{SlackOpenApi.Web.ObjsSubteam, :t}]]
  end

  def __fields__(:usergroups_list_default_json_resp) do
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
           "user_is_restricted",
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
           "upgrade_require",
           "fatal_error",
           "missing_charset",
           "superfluous_charset"
         ]},
      ok: {:const, false}
    ]
  end

  def __fields__(:usergroups_update_200_json_resp) do
    [ok: {:const, true}, usergroup: {SlackOpenApi.Web.ObjsSubteam, :t}]
  end

  def __fields__(:usergroups_update_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "permission_denied",
           "not_authed",
           "invalid_auth",
           "account_inactive",
           "token_revoked",
           "no_permission",
           "org_login_required",
           "user_is_bot",
           "user_is_restricted",
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
           "upgrade_require",
           "fatal_error",
           "missing_charset",
           "superfluous_charset"
         ]},
      ok: {:const, false}
    ]
  end
end
