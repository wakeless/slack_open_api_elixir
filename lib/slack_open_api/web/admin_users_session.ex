defmodule SlackOpenApi.Web.AdminUsersSession do
  @moduledoc """
  Provides API endpoints related to admin users session
  """

  @default_client SlackOpenApi.Client

  @doc """
  post `/admin.users.session.invalidate`

  Invalidate a single session for a user by session_id

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.users.session.invalidate)

  """
  @spec admin_users_session_invalidate(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_users_session_invalidate(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.AdminUsersSession, :admin_users_session_invalidate},
      url: "/admin.users.session.invalidate",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.DefaultSuccessTemplate, :t}},
        default: {SlackOpenApi.Web.DefaultErrorTemplate, :t}
      ],
      opts: opts
    })
  end

  @doc """
  post `/admin.users.session.reset`

  Wipes all valid sessions on all devices for a given user

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.users.session.reset)

  """
  @spec admin_users_session_reset(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_users_session_reset(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.AdminUsersSession, :admin_users_session_reset},
      url: "/admin.users.session.reset",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.DefaultSuccessTemplate, :t}},
        default: {SlackOpenApi.Web.DefaultErrorTemplate, :t}
      ],
      opts: opts
    })
  end
end
