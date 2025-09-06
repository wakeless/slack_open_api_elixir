defmodule SlackOpenApi.Web.Admin.Users do
  @moduledoc """
  Provides API endpoints related to admin/users
  """

  @default_client SlackOpenApi.Client

  @type assign_200_json_resp :: %{ok: true}

  @type assign_default_json_resp :: %{ok: false}

  @doc """
  post `/admin.users.assign`

  Add an Enterprise user to a workspace.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.users.assign)

  """
  @spec assign(map, keyword) :: {:ok, map} | {:error, map}
  def assign(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin.Users, :assign},
      url: "/admin.users.assign",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Admin.Users, :assign_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.Users, :assign_default_json_resp}
      ],
      opts: opts
    })
  end

  @type invite_200_json_resp :: %{ok: true}

  @type invite_default_json_resp :: %{ok: false}

  @doc """
  post `/admin.users.invite`

  Invite a user to a workspace.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.users.invite)

  """
  @spec invite(map, keyword) :: {:ok, map} | {:error, map}
  def invite(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin.Users, :invite},
      url: "/admin.users.invite",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Admin.Users, :invite_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.Users, :invite_default_json_resp}
      ],
      opts: opts
    })
  end

  @type list_200_json_resp :: %{ok: true}

  @type list_default_json_resp :: %{ok: false}

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
  @spec list(keyword) :: {:ok, map} | {:error, map}
  def list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:cursor, :limit, :team_id])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Admin.Users, :list},
      url: "/admin.users.list",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Admin.Users, :list_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.Users, :list_default_json_resp}
      ],
      opts: opts
    })
  end

  @type remove_200_json_resp :: %{ok: true}

  @type remove_default_json_resp :: %{ok: false}

  @doc """
  post `/admin.users.remove`

  Remove a user from a workspace.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.users.remove)

  """
  @spec remove(map, keyword) :: {:ok, map} | {:error, map}
  def remove(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin.Users, :remove},
      url: "/admin.users.remove",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Admin.Users, :remove_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.Users, :remove_default_json_resp}
      ],
      opts: opts
    })
  end

  @type set_admin_200_json_resp :: %{ok: true}

  @type set_admin_default_json_resp :: %{ok: false}

  @doc """
  post `/admin.users.setAdmin`

  Set an existing guest, regular user, or owner to be an admin user.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.users.setAdmin)

  """
  @spec set_admin(map, keyword) :: {:ok, map} | {:error, map}
  def set_admin(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin.Users, :set_admin},
      url: "/admin.users.setAdmin",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Admin.Users, :set_admin_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.Users, :set_admin_default_json_resp}
      ],
      opts: opts
    })
  end

  @type set_expiration_200_json_resp :: %{ok: true}

  @type set_expiration_default_json_resp :: %{ok: false}

  @doc """
  post `/admin.users.setExpiration`

  Set an expiration for a guest user

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.users.setExpiration)

  """
  @spec set_expiration(map, keyword) :: {:ok, map} | {:error, map}
  def set_expiration(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin.Users, :set_expiration},
      url: "/admin.users.setExpiration",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Admin.Users, :set_expiration_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.Users, :set_expiration_default_json_resp}
      ],
      opts: opts
    })
  end

  @type set_owner_200_json_resp :: %{ok: true}

  @type set_owner_default_json_resp :: %{ok: false}

  @doc """
  post `/admin.users.setOwner`

  Set an existing guest, regular user, or admin user to be a workspace owner.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.users.setOwner)

  """
  @spec set_owner(map, keyword) :: {:ok, map} | {:error, map}
  def set_owner(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin.Users, :set_owner},
      url: "/admin.users.setOwner",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Admin.Users, :set_owner_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.Users, :set_owner_default_json_resp}
      ],
      opts: opts
    })
  end

  @type set_regular_200_json_resp :: %{ok: true}

  @type set_regular_default_json_resp :: %{ok: false}

  @doc """
  post `/admin.users.setRegular`

  Set an existing guest user, admin user, or owner to be a regular user.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.users.setRegular)

  """
  @spec set_regular(map, keyword) :: {:ok, map} | {:error, map}
  def set_regular(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin.Users, :set_regular},
      url: "/admin.users.setRegular",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Admin.Users, :set_regular_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.Users, :set_regular_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:assign_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:assign_default_json_resp) do
    [ok: {:const, false}]
  end

  def __fields__(:invite_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:invite_default_json_resp) do
    [ok: {:const, false}]
  end

  def __fields__(:list_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:list_default_json_resp) do
    [ok: {:const, false}]
  end

  def __fields__(:remove_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:remove_default_json_resp) do
    [ok: {:const, false}]
  end

  def __fields__(:set_admin_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:set_admin_default_json_resp) do
    [ok: {:const, false}]
  end

  def __fields__(:set_expiration_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:set_expiration_default_json_resp) do
    [ok: {:const, false}]
  end

  def __fields__(:set_owner_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:set_owner_default_json_resp) do
    [ok: {:const, false}]
  end

  def __fields__(:set_regular_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:set_regular_default_json_resp) do
    [ok: {:const, false}]
  end
end
