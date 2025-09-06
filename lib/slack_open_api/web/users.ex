defmodule SlackOpenApi.Web.Users do
  @moduledoc """
  Provides API endpoints related to users
  """

  @default_client SlackOpenApi.Client

  @type users_conversations_200_json_resp :: %{
          channels: [map],
          ok: true,
          response_metadata:
            SlackOpenApi.Web.UsersResponseMetadata.users_conversations_200_json_resp() | nil
        }

  @type users_conversations_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  get `/users.conversations`

  List conversations the calling user may access.

  ## Options

    * `token`: Authentication token. Requires scope: `conversations:read`
    * `user`: Browse conversations by a specific user ID's membership. Non-public channels are restricted to those where the calling user shares membership.
    * `types`: Mix and match channel types by providing a comma-separated list of any combination of `public_channel`, `private_channel`, `mpim`, `im`
    * `exclude_archived`: Set to `true` to exclude archived channels from the list
    * `limit`: The maximum number of items to return. Fewer than the requested number of items may be returned, even if the end of the list hasn't been reached. Must be an integer no larger than 1000.
    * `cursor`: Paginate through collections of data by setting the `cursor` parameter to a `next_cursor` attribute returned by a previous request's `response_metadata`. Default value fetches the first "page" of the collection. See [pagination](/docs/pagination) for more detail.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/users.conversations)

  """
  @spec users_conversations(keyword) :: {:ok, map} | {:error, map}
  def users_conversations(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:cursor, :exclude_archived, :limit, :token, :types, :user])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Users, :users_conversations},
      url: "/users.conversations",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Users, :users_conversations_200_json_resp}},
        default: {SlackOpenApi.Web.Users, :users_conversations_default_json_resp}
      ],
      opts: opts
    })
  end

  @type users_delete_photo_200_json_resp :: %{ok: true}

  @type users_delete_photo_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  post `/users.deletePhoto`

  Delete the user profile photo

  ## Resources

    * [API method documentation](https://api.slack.com/methods/users.deletePhoto)

  """
  @spec users_delete_photo(map, keyword) :: {:ok, map} | {:error, map}
  def users_delete_photo(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Users, :users_delete_photo},
      url: "/users.deletePhoto",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Users, :users_delete_photo_200_json_resp}},
        default: {SlackOpenApi.Web.Users, :users_delete_photo_default_json_resp}
      ],
      opts: opts
    })
  end

  @type users_get_presence_200_json_resp :: %{
          auto_away: boolean | nil,
          connection_count: integer | nil,
          last_activity: integer | nil,
          manual_away: boolean | nil,
          ok: true,
          online: boolean | nil,
          presence: String.t()
        }

  @type users_get_presence_default_json_resp :: %{error: String.t(), ok: false}

  @doc """
  get `/users.getPresence`

  Gets user presence information.

  ## Options

    * `token`: Authentication token. Requires scope: `users:read`
    * `user`: User to get presence info on. Defaults to the authed user.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/users.getPresence)

  """
  @spec users_get_presence(keyword) :: {:ok, map} | {:error, map}
  def users_get_presence(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:token, :user])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Users, :users_get_presence},
      url: "/users.getPresence",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Users, :users_get_presence_200_json_resp}},
        default: {SlackOpenApi.Web.Users, :users_get_presence_default_json_resp}
      ],
      opts: opts
    })
  end

  @type users_identity_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  get `/users.identity`

  Get a user's identity.

  ## Options

    * `token`: Authentication token. Requires scope: `identity.basic`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/users.identity)

  """
  @spec users_identity(keyword) :: {:ok, map} | {:error, map}
  def users_identity(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Users, :users_identity},
      url: "/users.identity",
      method: :get,
      query: query,
      response: [
        {200, :map},
        default: {SlackOpenApi.Web.Users, :users_identity_default_json_resp}
      ],
      opts: opts
    })
  end

  @type users_info_200_json_resp :: %{ok: true, user: map}

  @type users_info_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  get `/users.info`

  Gets information about a user.

  ## Options

    * `token`: Authentication token. Requires scope: `users:read`
    * `include_locale`: Set this to `true` to receive the locale for this user. Defaults to `false`
    * `user`: User to get info on

  ## Resources

    * [API method documentation](https://api.slack.com/methods/users.info)

  """
  @spec users_info(keyword) :: {:ok, map} | {:error, map}
  def users_info(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:include_locale, :token, :user])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Users, :users_info},
      url: "/users.info",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Users, :users_info_200_json_resp}},
        default: {SlackOpenApi.Web.Users, :users_info_default_json_resp}
      ],
      opts: opts
    })
  end

  @type users_list_200_json_resp :: %{
          cache_ts: integer,
          members: [map],
          ok: true,
          response_metadata: map | nil
        }

  @type users_list_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  get `/users.list`

  Lists all users in a Slack team.

  ## Options

    * `token`: Authentication token. Requires scope: `users:read`
    * `limit`: The maximum number of items to return. Fewer than the requested number of items may be returned, even if the end of the users list hasn't been reached. Providing no `limit` value will result in Slack attempting to deliver you the entire result set. If the collection is too large you may experience `limit_required` or HTTP 500 errors.
    * `cursor`: Paginate through collections of data by setting the `cursor` parameter to a `next_cursor` attribute returned by a previous request's `response_metadata`. Default value fetches the first "page" of the collection. See [pagination](/docs/pagination) for more detail.
    * `include_locale`: Set this to `true` to receive the locale for users. Defaults to `false`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/users.list)

  """
  @spec users_list(keyword) :: {:ok, map} | {:error, map}
  def users_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:cursor, :include_locale, :limit, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Users, :users_list},
      url: "/users.list",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Users, :users_list_200_json_resp}},
        default: {SlackOpenApi.Web.Users, :users_list_default_json_resp}
      ],
      opts: opts
    })
  end

  @type users_lookup_by_email_200_json_resp :: %{ok: true, user: map}

  @type users_lookup_by_email_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  get `/users.lookupByEmail`

  Find a user with an email address.

  ## Options

    * `token`: Authentication token. Requires scope: `users:read.email`
    * `email`: An email address belonging to a user in the workspace

  ## Resources

    * [API method documentation](https://api.slack.com/methods/users.lookupByEmail)

  """
  @spec users_lookup_by_email(keyword) :: {:ok, map} | {:error, map}
  def users_lookup_by_email(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:email, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Users, :users_lookup_by_email},
      url: "/users.lookupByEmail",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Users, :users_lookup_by_email_200_json_resp}},
        default: {SlackOpenApi.Web.Users, :users_lookup_by_email_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc """
  get `/users.profile.get`

  Retrieves a user's profile information.

  ## Options

    * `token`: Authentication token. Requires scope: `users.profile:read`
    * `include_labels`: Include labels for each ID in custom profile fields
    * `user`: User to retrieve profile info for

  ## Resources

    * [API method documentation](https://api.slack.com/methods/users.profile.get)

  """
  @spec users_profile_get(keyword) ::
          {:ok, SlackOpenApi.Web.UsersProfileGetSchema.t()}
          | {:error, SlackOpenApi.Web.UsersProfileGetErrorSchema.t()}
  def users_profile_get(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:include_labels, :token, :user])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Users, :users_profile_get},
      url: "/users.profile.get",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.UsersProfileGetSchema, :t}},
        default: {SlackOpenApi.Web.UsersProfileGetErrorSchema, :t}
      ],
      opts: opts
    })
  end

  @doc """
  post `/users.profile.set`

  Set the profile information for a user.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/users.profile.set)

  """
  @spec users_profile_set(map, keyword) ::
          {:ok, SlackOpenApi.Web.UsersProfileSetSchema.t()}
          | {:error, SlackOpenApi.Web.UsersProfileSetErrorSchema.t()}
  def users_profile_set(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Users, :users_profile_set},
      url: "/users.profile.set",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.UsersProfileSetSchema, :t}},
        default: {SlackOpenApi.Web.UsersProfileSetErrorSchema, :t}
      ],
      opts: opts
    })
  end

  @type users_set_active_200_json_resp :: %{ok: true}

  @type users_set_active_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  post `/users.setActive`

  Marked a user as active. Deprecated and non-functional.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/users.setActive)

  """
  @spec users_set_active(keyword) :: {:ok, map} | {:error, map}
  def users_set_active(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Users, :users_set_active},
      url: "/users.setActive",
      method: :post,
      response: [
        {200, {SlackOpenApi.Web.Users, :users_set_active_200_json_resp}},
        default: {SlackOpenApi.Web.Users, :users_set_active_default_json_resp}
      ],
      opts: opts
    })
  end

  @type users_set_photo_200_json_resp :: %{
          ok: true,
          profile: SlackOpenApi.Web.UsersProfile.users_set_photo_200_json_resp()
        }

  @type users_set_photo_default_json_resp :: %{
          callstack: String.t() | nil,
          debug_step: String.t() | nil,
          dims: String.t() | nil,
          error: String.t(),
          ok: false,
          time_ident: integer | nil
        }

  @doc """
  post `/users.setPhoto`

  Set the user profile photo

  ## Resources

    * [API method documentation](https://api.slack.com/methods/users.setPhoto)

  """
  @spec users_set_photo(map, keyword) :: {:ok, map} | {:error, map}
  def users_set_photo(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Users, :users_set_photo},
      url: "/users.setPhoto",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Users, :users_set_photo_200_json_resp}},
        default: {SlackOpenApi.Web.Users, :users_set_photo_default_json_resp}
      ],
      opts: opts
    })
  end

  @type users_set_presence_200_json_resp :: %{ok: true}

  @type users_set_presence_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  post `/users.setPresence`

  Manually sets user presence.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/users.setPresence)

  """
  @spec users_set_presence(map, keyword) :: {:ok, map} | {:error, map}
  def users_set_presence(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Users, :users_set_presence},
      url: "/users.setPresence",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Users, :users_set_presence_200_json_resp}},
        default: {SlackOpenApi.Web.Users, :users_set_presence_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:users_conversations_200_json_resp) do
    [
      channels: [:map],
      ok: {:const, true},
      response_metadata:
        {SlackOpenApi.Web.UsersResponseMetadata, :users_conversations_200_json_resp}
    ]
  end

  def __fields__(:users_conversations_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "method_not_supported_for_channel_type",
           "missing_scope",
           "invalid_types",
           "invalid_cursor",
           "invalid_limit",
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

  def __fields__(:users_delete_photo_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:users_delete_photo_default_json_resp) do
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

  def __fields__(:users_get_presence_200_json_resp) do
    [
      auto_away: :boolean,
      connection_count: :integer,
      last_activity: :integer,
      manual_away: :boolean,
      ok: {:const, true},
      online: :boolean,
      presence: {:string, :generic}
    ]
  end

  def __fields__(:users_get_presence_default_json_resp) do
    [error: {:string, :generic}, ok: {:const, false}]
  end

  def __fields__(:users_identity_default_json_resp) do
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

  def __fields__(:users_info_200_json_resp) do
    [ok: {:const, true}, user: :map]
  end

  def __fields__(:users_info_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "user_not_found",
           "user_not_visible",
           "not_authed",
           "invalid_auth",
           "account_inactive",
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
           "upgrade_required"
         ]},
      ok: {:const, false}
    ]
  end

  def __fields__(:users_list_200_json_resp) do
    [cache_ts: :integer, members: [:map], ok: {:const, true}, response_metadata: :map]
  end

  def __fields__(:users_list_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "limit_required",
           "invalid_cursor",
           "not_authed",
           "invalid_auth",
           "account_inactive",
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

  def __fields__(:users_lookup_by_email_200_json_resp) do
    [ok: {:const, true}, user: :map]
  end

  def __fields__(:users_lookup_by_email_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "users_not_found",
           "enterprise_is_restricted",
           "not_authed",
           "invalid_auth",
           "account_inactive",
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

  def __fields__(:users_set_active_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:users_set_active_default_json_resp) do
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
           "ekm_access_denied",
           "missing_scope",
           "invalid_arguments",
           "invalid_arg_name",
           "invalid_charset",
           "invalid_form_data",
           "invalid_post_type",
           "missing_post_type",
           "team_added_to_org",
           "request_timeout",
           "fatal_error",
           "internal_error"
         ]},
      ok: {:const, false}
    ]
  end

  def __fields__(:users_set_photo_200_json_resp) do
    [ok: {:const, true}, profile: {SlackOpenApi.Web.UsersProfile, :users_set_photo_200_json_resp}]
  end

  def __fields__(:users_set_photo_default_json_resp) do
    [
      callstack: {:string, :generic},
      debug_step: {:string, :generic},
      dims: {:string, :generic},
      error:
        {:enum,
         [
           "bad_image",
           "too_large",
           "too_many_frames",
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
      ok: {:const, false},
      time_ident: :integer
    ]
  end

  def __fields__(:users_set_presence_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:users_set_presence_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "invalid_presence",
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
end
