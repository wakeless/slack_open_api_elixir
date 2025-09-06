defmodule SlackOpenApi.Web.AdminEmoji do
  @moduledoc """
  Provides API endpoints related to admin emoji
  """

  @default_client SlackOpenApi.Client

  @doc """
  post `/admin.emoji.add`

  Add an emoji.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.emoji.add)

  """
  @spec admin_emoji_add(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_emoji_add(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.AdminEmoji, :admin_emoji_add},
      url: "/admin.emoji.add",
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
  post `/admin.emoji.addAlias`

  Add an emoji alias.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.emoji.addAlias)

  """
  @spec admin_emoji_add_alias(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_emoji_add_alias(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.AdminEmoji, :admin_emoji_add_alias},
      url: "/admin.emoji.addAlias",
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
  get `/admin.emoji.list`

  List emoji for an Enterprise Grid organization.

  ## Options

    * `token`: Authentication token. Requires scope: `admin.teams:read`
    * `cursor`: Set `cursor` to `next_cursor` returned by the previous call to list items in the next page
    * `limit`: The maximum number of items to return. Must be between 1 - 1000 both inclusive.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.emoji.list)

  """
  @spec admin_emoji_list(keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_emoji_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:cursor, :limit, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.AdminEmoji, :admin_emoji_list},
      url: "/admin.emoji.list",
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
  post `/admin.emoji.remove`

  Remove an emoji across an Enterprise Grid organization

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.emoji.remove)

  """
  @spec admin_emoji_remove(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_emoji_remove(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.AdminEmoji, :admin_emoji_remove},
      url: "/admin.emoji.remove",
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
  post `/admin.emoji.rename`

  Rename an emoji.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.emoji.rename)

  """
  @spec admin_emoji_rename(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_emoji_rename(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.AdminEmoji, :admin_emoji_rename},
      url: "/admin.emoji.rename",
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
