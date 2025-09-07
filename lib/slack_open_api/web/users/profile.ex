defmodule SlackOpenApi.Web.Users.Profile do
  @moduledoc """
  Provides API endpoints related to users/profile
  """

  @default_client SlackOpenApi.Client

  @type get_200_json_resp :: %{ok: true, profile: SlackOpenApi.Web.ObjsUserProfile.t()}

  @type get_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

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
  @spec get(opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Users.Profile.get_200_json_resp()}
          | {:error, SlackOpenApi.Web.Users.Profile.get_default_json_resp()}
  def get(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:include_labels, :token, :user])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Users.Profile, :get},
      url: "/users.profile.get",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Users.Profile, :get_200_json_resp}},
        default: {SlackOpenApi.Web.Users.Profile, :get_default_json_resp}
      ],
      opts: opts
    })
  end

  @type set_200_json_resp :: %{
          email_pending: String.t() | nil,
          ok: true,
          profile: SlackOpenApi.Web.ObjsUserProfile.t(),
          username: String.t()
        }

  @type set_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

  @doc """
  post `/users.profile.set`

  Set the profile information for a user.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/users.profile.set)

  """
  @spec set(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Users.Profile.set_200_json_resp()}
          | {:error, SlackOpenApi.Web.Users.Profile.set_default_json_resp()}
  def set(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Users.Profile, :set},
      url: "/users.profile.set",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Users.Profile, :set_200_json_resp}},
        default: {SlackOpenApi.Web.Users.Profile, :set_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:get_200_json_resp) do
    [ok: {:const, true}, profile: {SlackOpenApi.Web.ObjsUserProfile, :t}]
  end

  def __fields__(:get_default_json_resp) do
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

  def __fields__(:set_200_json_resp) do
    [
      email_pending: {:string, :email},
      ok: {:const, true},
      profile: {SlackOpenApi.Web.ObjsUserProfile, :t},
      username: {:string, :generic}
    ]
  end

  def __fields__(:set_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "reserved_name",
           "invalid_profile",
           "profile_set_failed",
           "not_admin",
           "not_app_admin",
           "cannot_update_admin_user",
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
