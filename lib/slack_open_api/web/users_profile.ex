defmodule SlackOpenApi.Web.UsersProfile do
  @moduledoc """
  Provides API endpoints related to users profile
  """

  @default_client SlackOpenApi.Client

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
      call: {SlackOpenApi.Web.UsersProfile, :users_profile_get},
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
      call: {SlackOpenApi.Web.UsersProfile, :users_profile_set},
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
end
