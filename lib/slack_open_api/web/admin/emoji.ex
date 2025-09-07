defmodule SlackOpenApi.Web.Admin.Emoji do
  @moduledoc """
  Provides API endpoints related to admin/emoji
  """

  @default_client SlackOpenApi.Client

  @type add_200_json_resp :: %{ok: true}

  @type add_default_json_resp :: %{ok: false}

  @doc """
  post `/admin.emoji.add`

  Add an emoji.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.emoji.add)

  """
  @spec add(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Admin.Emoji.add_200_json_resp()}
          | {:error, SlackOpenApi.Web.Admin.Emoji.add_default_json_resp()}
  def add(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin.Emoji, :add},
      url: "/admin.emoji.add",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Admin.Emoji, :add_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.Emoji, :add_default_json_resp}
      ],
      opts: opts
    })
  end

  @type add_alias_200_json_resp :: %{ok: true}

  @type add_alias_default_json_resp :: %{ok: false}

  @doc """
  post `/admin.emoji.addAlias`

  Add an emoji alias.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.emoji.addAlias)

  """
  @spec add_alias(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Admin.Emoji.add_alias_200_json_resp()}
          | {:error, SlackOpenApi.Web.Admin.Emoji.add_alias_default_json_resp()}
  def add_alias(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin.Emoji, :add_alias},
      url: "/admin.emoji.addAlias",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Admin.Emoji, :add_alias_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.Emoji, :add_alias_default_json_resp}
      ],
      opts: opts
    })
  end

  @type list_200_json_resp :: %{ok: true}

  @type list_default_json_resp :: %{ok: false}

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
  @spec list(opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Admin.Emoji.list_200_json_resp()}
          | {:error, SlackOpenApi.Web.Admin.Emoji.list_default_json_resp()}
  def list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:cursor, :limit, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Admin.Emoji, :list},
      url: "/admin.emoji.list",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Admin.Emoji, :list_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.Emoji, :list_default_json_resp}
      ],
      opts: opts
    })
  end

  @type remove_200_json_resp :: %{ok: true}

  @type remove_default_json_resp :: %{ok: false}

  @doc """
  post `/admin.emoji.remove`

  Remove an emoji across an Enterprise Grid organization

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.emoji.remove)

  """
  @spec remove(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Admin.Emoji.remove_200_json_resp()}
          | {:error, SlackOpenApi.Web.Admin.Emoji.remove_default_json_resp()}
  def remove(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin.Emoji, :remove},
      url: "/admin.emoji.remove",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Admin.Emoji, :remove_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.Emoji, :remove_default_json_resp}
      ],
      opts: opts
    })
  end

  @type rename_200_json_resp :: %{ok: true}

  @type rename_default_json_resp :: %{ok: false}

  @doc """
  post `/admin.emoji.rename`

  Rename an emoji.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.emoji.rename)

  """
  @spec rename(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Admin.Emoji.rename_200_json_resp()}
          | {:error, SlackOpenApi.Web.Admin.Emoji.rename_default_json_resp()}
  def rename(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin.Emoji, :rename},
      url: "/admin.emoji.rename",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Admin.Emoji, :rename_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.Emoji, :rename_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:add_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:add_alias_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:add_alias_default_json_resp) do
    [ok: {:const, false}]
  end

  def __fields__(:add_default_json_resp) do
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

  def __fields__(:rename_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:rename_default_json_resp) do
    [ok: {:const, false}]
  end
end
