defmodule SlackOpenApi.Web.Usergroups do
  @moduledoc """
  Provides API endpoints related to usergroups
  """

  @default_client SlackOpenApi.Client

  @type create_200_json_resp :: %{ok: true, usergroup: SlackOpenApi.Web.ObjsSubteam.t()}

  @type create_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

  @doc """
  post `/usergroups.create`

  Create a User Group

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/usergroups.create)

  """
  @spec create(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Usergroups.create_200_json_resp()}
          | {:error, SlackOpenApi.Web.Usergroups.create_default_json_resp()}
  def create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Usergroups, :create},
      url: "/usergroups.create",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Usergroups, :create_200_json_resp}},
        default: {SlackOpenApi.Web.Usergroups, :create_default_json_resp}
      ],
      opts: opts
    })
  end

  @type disable_200_json_resp :: %{ok: true, usergroup: SlackOpenApi.Web.ObjsSubteam.t()}

  @type disable_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

  @doc """
  post `/usergroups.disable`

  Disable an existing User Group

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/usergroups.disable)

  """
  @spec disable(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Usergroups.disable_200_json_resp()}
          | {:error, SlackOpenApi.Web.Usergroups.disable_default_json_resp()}
  def disable(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Usergroups, :disable},
      url: "/usergroups.disable",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Usergroups, :disable_200_json_resp}},
        default: {SlackOpenApi.Web.Usergroups, :disable_default_json_resp}
      ],
      opts: opts
    })
  end

  @type enable_200_json_resp :: %{ok: true, usergroup: SlackOpenApi.Web.ObjsSubteam.t()}

  @type enable_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

  @doc """
  post `/usergroups.enable`

  Enable a User Group

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/usergroups.enable)

  """
  @spec enable(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Usergroups.enable_200_json_resp()}
          | {:error, SlackOpenApi.Web.Usergroups.enable_default_json_resp()}
  def enable(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Usergroups, :enable},
      url: "/usergroups.enable",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Usergroups, :enable_200_json_resp}},
        default: {SlackOpenApi.Web.Usergroups, :enable_default_json_resp}
      ],
      opts: opts
    })
  end

  @type list_200_json_resp :: %{ok: true, usergroups: [SlackOpenApi.Web.ObjsSubteam.t()]}

  @type list_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

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
  @spec list(opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Usergroups.list_200_json_resp()}
          | {:error, SlackOpenApi.Web.Usergroups.list_default_json_resp()}
  def list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:include_count, :include_disabled, :include_users, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Usergroups, :list},
      url: "/usergroups.list",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Usergroups, :list_200_json_resp}},
        default: {SlackOpenApi.Web.Usergroups, :list_default_json_resp}
      ],
      opts: opts
    })
  end

  @type update_200_json_resp :: %{ok: true, usergroup: SlackOpenApi.Web.ObjsSubteam.t()}

  @type update_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

  @doc """
  post `/usergroups.update`

  Update an existing User Group

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/usergroups.update)

  """
  @spec update(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Usergroups.update_200_json_resp()}
          | {:error, SlackOpenApi.Web.Usergroups.update_default_json_resp()}
  def update(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Usergroups, :update},
      url: "/usergroups.update",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Usergroups, :update_200_json_resp}},
        default: {SlackOpenApi.Web.Usergroups, :update_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:create_200_json_resp) do
    [ok: {:const, true}, usergroup: {SlackOpenApi.Web.ObjsSubteam, :t}]
  end

  def __fields__(:create_default_json_resp) do
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

  def __fields__(:disable_200_json_resp) do
    [ok: {:const, true}, usergroup: {SlackOpenApi.Web.ObjsSubteam, :t}]
  end

  def __fields__(:disable_default_json_resp) do
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

  def __fields__(:enable_200_json_resp) do
    [ok: {:const, true}, usergroup: {SlackOpenApi.Web.ObjsSubteam, :t}]
  end

  def __fields__(:enable_default_json_resp) do
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

  def __fields__(:list_200_json_resp) do
    [ok: {:const, true}, usergroups: [{SlackOpenApi.Web.ObjsSubteam, :t}]]
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
