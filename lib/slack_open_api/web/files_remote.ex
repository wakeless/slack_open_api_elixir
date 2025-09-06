defmodule SlackOpenApi.Web.FilesRemote do
  @moduledoc """
  Provides API endpoints related to files remote
  """

  @default_client SlackOpenApi.Client

  @doc """
  post `/files.remote.add`

  Adds a file from a remote service

  ## Resources

    * [API method documentation](https://api.slack.com/methods/files.remote.add)

  """
  @spec files_remote_add(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def files_remote_add(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.FilesRemote, :files_remote_add},
      url: "/files.remote.add",
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
  get `/files.remote.info`

  Retrieve information about a remote file added to Slack

  ## Options

    * `token`: Authentication token. Requires scope: `remote_files:read`
    * `file`: Specify a file by providing its ID.
    * `external_id`: Creator defined GUID for the file.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/files.remote.info)

  """
  @spec files_remote_info(keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def files_remote_info(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:external_id, :file, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.FilesRemote, :files_remote_info},
      url: "/files.remote.info",
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
  @spec files_remote_list(keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def files_remote_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:channel, :cursor, :limit, :token, :ts_from, :ts_to])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.FilesRemote, :files_remote_list},
      url: "/files.remote.list",
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
  post `/files.remote.remove`

  Remove a remote file.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/files.remote.remove)

  """
  @spec files_remote_remove(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def files_remote_remove(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.FilesRemote, :files_remote_remove},
      url: "/files.remote.remove",
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
  @spec files_remote_share(keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def files_remote_share(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:channels, :external_id, :file, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.FilesRemote, :files_remote_share},
      url: "/files.remote.share",
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
  post `/files.remote.update`

  Updates an existing remote file.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/files.remote.update)

  """
  @spec files_remote_update(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def files_remote_update(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.FilesRemote, :files_remote_update},
      url: "/files.remote.update",
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
