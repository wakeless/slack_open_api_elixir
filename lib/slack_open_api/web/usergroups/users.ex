defmodule SlackOpenApi.Web.Usergroups.Users do
  @moduledoc """
  Provides API endpoints related to usergroups/users
  """

  @default_client SlackOpenApi.Client

  @type list_200_json_resp :: %{ok: true, users: [String.t()]}

  @type list_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

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
  @spec list(keyword) :: {:ok, map} | {:error, map}
  def list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:include_disabled, :token, :usergroup])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Usergroups.Users, :list},
      url: "/usergroups.users.list",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Usergroups.Users, :list_200_json_resp}},
        default: {SlackOpenApi.Web.Usergroups.Users, :list_default_json_resp}
      ],
      opts: opts
    })
  end

  @type update_200_json_resp :: %{ok: true, usergroup: SlackOpenApi.Web.ObjsSubteam.t()}

  @type update_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

  @doc """
  post `/usergroups.users.update`

  Update the list of users for a User Group

  ## Resources

    * [API method documentation](https://api.slack.com/methods/usergroups.users.update)

  """
  @spec update(map, keyword) :: {:ok, map} | {:error, map}
  def update(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Usergroups.Users, :update},
      url: "/usergroups.users.update",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Usergroups.Users, :update_200_json_resp}},
        default: {SlackOpenApi.Web.Usergroups.Users, :update_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:list_200_json_resp) do
    [ok: {:const, true}, users: [string: :generic]]
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

  def __fields__(:update_200_json_resp) do
    [ok: {:const, true}, usergroup: {SlackOpenApi.Web.ObjsSubteam, :t}]
  end

  def __fields__(:update_default_json_resp) do
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
