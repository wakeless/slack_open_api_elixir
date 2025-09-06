defmodule SlackOpenApi.Web.AdminUsers do
  @moduledoc """
  Provides API endpoints related to admin users
  """

  @default_client SlackOpenApi.Client

  @doc """
  post `/admin.users.assign`

  Add an Enterprise user to a workspace.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.users.assign)

  """
  @spec admin_users_assign(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_users_assign(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.AdminUsers, :admin_users_assign},
      url: "/admin.users.assign",
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
  post `/admin.users.invite`

  Invite a user to a workspace.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.users.invite)

  """
  @spec admin_users_invite(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_users_invite(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.AdminUsers, :admin_users_invite},
      url: "/admin.users.invite",
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
  get `/admin.users.list`

  List users on a workspace

  ## Options

    * `team_id`: The ID (`T1234`) of the workspace.
    * `cursor`: Set `cursor` to `next_cursor` returned by the previous call to list items in the next page.
    * `limit`: Limit for how many users to be retrieved per page

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.users.list)

  """
  @spec admin_users_list(keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_users_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:cursor, :limit, :team_id])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.AdminUsers, :admin_users_list},
      url: "/admin.users.list",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.DefaultSuccessTemplate, :t}},
        default: {SlackOpenApi.Web.DefaultErrorTemplate, :t}
      ],
      opts: opts
    })
  end

  @doc """
  post `/admin.users.remove`

  Remove a user from a workspace.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.users.remove)

  """
  @spec admin_users_remove(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_users_remove(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.AdminUsers, :admin_users_remove},
      url: "/admin.users.remove",
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
  post `/admin.users.setAdmin`

  Set an existing guest, regular user, or owner to be an admin user.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.users.setAdmin)

  """
  @spec admin_users_set_admin(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_users_set_admin(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.AdminUsers, :admin_users_set_admin},
      url: "/admin.users.setAdmin",
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
  post `/admin.users.setExpiration`

  Set an expiration for a guest user

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.users.setExpiration)

  """
  @spec admin_users_set_expiration(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_users_set_expiration(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.AdminUsers, :admin_users_set_expiration},
      url: "/admin.users.setExpiration",
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
  post `/admin.users.setOwner`

  Set an existing guest, regular user, or admin user to be a workspace owner.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.users.setOwner)

  """
  @spec admin_users_set_owner(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_users_set_owner(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.AdminUsers, :admin_users_set_owner},
      url: "/admin.users.setOwner",
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
  post `/admin.users.setRegular`

  Set an existing guest user, admin user, or owner to be a regular user.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.users.setRegular)

  """
  @spec admin_users_set_regular(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_users_set_regular(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.AdminUsers, :admin_users_set_regular},
      url: "/admin.users.setRegular",
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
