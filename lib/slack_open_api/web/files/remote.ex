defmodule SlackOpenApi.Web.Files.Remote do
  @moduledoc """
  Provides API endpoints related to files/remote
  """

  @default_client SlackOpenApi.Client

  @type add_200_json_resp :: %{ok: true}

  @type add_default_json_resp :: %{ok: false}

  @doc """
  post `/files.remote.add`

  Adds a file from a remote service

  ## Resources

    * [API method documentation](https://api.slack.com/methods/files.remote.add)

  """
  @spec add(map, keyword) :: {:ok, map} | {:error, map}
  def add(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Files.Remote, :add},
      url: "/files.remote.add",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Files.Remote, :add_200_json_resp}},
        default: {SlackOpenApi.Web.Files.Remote, :add_default_json_resp}
      ],
      opts: opts
    })
  end

  @type info_200_json_resp :: %{ok: true}

  @type info_default_json_resp :: %{ok: false}

  @doc """
  get `/files.remote.info`

  Retrieve information about a remote file added to Slack

  ## Options

    * `token`: Authentication token. Requires scope: `remote_files:read`
    * `file`: Specify a file by providing its ID.
    * `external_id`: Creator defined GUID for the file.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/files.remote.info)

  """
  @spec info(keyword) :: {:ok, map} | {:error, map}
  def info(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:external_id, :file, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Files.Remote, :info},
      url: "/files.remote.info",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Files.Remote, :info_200_json_resp}},
        default: {SlackOpenApi.Web.Files.Remote, :info_default_json_resp}
      ],
      opts: opts
    })
  end

  @type list_200_json_resp :: %{ok: true}

  @type list_default_json_resp :: %{ok: false}

  @doc """
  get `/files.remote.list`

  Retrieve information about a remote file added to Slack

  ## Options

    * `token`: Authentication token. Requires scope: `remote_files:read`
    * `channel`: Filter files appearing in a specific channel, indicated by its ID.
    * `ts_from`: Filter files created after this timestamp (inclusive).
    * `ts_to`: Filter files created before this timestamp (inclusive).
    * `limit`: The maximum number of items to return.
    * `cursor`: Paginate through collections of data by setting the `cursor` parameter to a `next_cursor` attribute returned by a previous request's `response_metadata`. Default value fetches the first "page" of the collection. See [pagination](/docs/pagination) for more detail.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/files.remote.list)

  """
  @spec list(keyword) :: {:ok, map} | {:error, map}
  def list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:channel, :cursor, :limit, :token, :ts_from, :ts_to])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Files.Remote, :list},
      url: "/files.remote.list",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Files.Remote, :list_200_json_resp}},
        default: {SlackOpenApi.Web.Files.Remote, :list_default_json_resp}
      ],
      opts: opts
    })
  end

  @type remove_200_json_resp :: %{ok: true}

  @type remove_default_json_resp :: %{ok: false}

  @doc """
  post `/files.remote.remove`

  Remove a remote file.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/files.remote.remove)

  """
  @spec remove(map, keyword) :: {:ok, map} | {:error, map}
  def remove(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Files.Remote, :remove},
      url: "/files.remote.remove",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Files.Remote, :remove_200_json_resp}},
        default: {SlackOpenApi.Web.Files.Remote, :remove_default_json_resp}
      ],
      opts: opts
    })
  end

  @type share_200_json_resp :: %{ok: true}

  @type share_default_json_resp :: %{ok: false}

  @doc """
  get `/files.remote.share`

  Share a remote file into a channel.

  ## Options

    * `token`: Authentication token. Requires scope: `remote_files:share`
    * `file`: Specify a file registered with Slack by providing its ID. Either this field or `external_id` or both are required.
    * `external_id`: The globally unique identifier (GUID) for the file, as set by the app registering the file with Slack.  Either this field or `file` or both are required.
    * `channels`: Comma-separated list of channel IDs where the file will be shared.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/files.remote.share)

  """
  @spec share(keyword) :: {:ok, map} | {:error, map}
  def share(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:channels, :external_id, :file, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Files.Remote, :share},
      url: "/files.remote.share",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Files.Remote, :share_200_json_resp}},
        default: {SlackOpenApi.Web.Files.Remote, :share_default_json_resp}
      ],
      opts: opts
    })
  end

  @type update_200_json_resp :: %{ok: true}

  @type update_default_json_resp :: %{ok: false}

  @doc """
  post `/files.remote.update`

  Updates an existing remote file.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/files.remote.update)

  """
  @spec update(map, keyword) :: {:ok, map} | {:error, map}
  def update(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Files.Remote, :update},
      url: "/files.remote.update",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Files.Remote, :update_200_json_resp}},
        default: {SlackOpenApi.Web.Files.Remote, :update_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:add_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:add_default_json_resp) do
    [ok: {:const, false}]
  end

  def __fields__(:info_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:info_default_json_resp) do
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

  def __fields__(:share_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:share_default_json_resp) do
    [ok: {:const, false}]
  end

  def __fields__(:update_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:update_default_json_resp) do
    [ok: {:const, false}]
  end
end
