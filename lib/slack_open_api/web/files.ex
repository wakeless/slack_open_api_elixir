defmodule SlackOpenApi.Web.Files do
  @moduledoc """
  Provides API endpoints related to files
  """

  @default_client SlackOpenApi.Client

  @doc """
  post `/files.comments.delete`

  Deletes an existing comment on a file.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/files.comments.delete)

  """
  @spec files_comments_delete(map, keyword) ::
          {:ok, SlackOpenApi.Web.FilesCommentsDeleteSchema.t()}
          | {:error, SlackOpenApi.Web.FilesCommentsDeleteErrorSchema.t()}
  def files_comments_delete(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Files, :files_comments_delete},
      url: "/files.comments.delete",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.FilesCommentsDeleteSchema, :t}},
        default: {SlackOpenApi.Web.FilesCommentsDeleteErrorSchema, :t}
      ],
      opts: opts
    })
  end

  @type files_delete_200_json_resp :: %{ok: true}

  @type files_delete_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  post `/files.delete`

  Deletes a file.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/files.delete)

  """
  @spec files_delete(map, keyword) :: {:ok, map} | {:error, map}
  def files_delete(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Files, :files_delete},
      url: "/files.delete",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Files, :files_delete_200_json_resp}},
        default: {SlackOpenApi.Web.Files, :files_delete_default_json_resp}
      ],
      opts: opts
    })
  end

  @type files_info_200_json_resp :: %{
          comments: [map],
          content_html: map | nil,
          editor: String.t() | nil,
          file: SlackOpenApi.Web.ObjsFile.t(),
          ok: true,
          paging: SlackOpenApi.Web.ObjsPaging.t() | nil,
          response_metadata: map | nil
        }

  @type files_info_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  get `/files.info`

  Gets information about a file.

  ## Options

    * `token`: Authentication token. Requires scope: `files:read`
    * `file`: Specify a file by providing its ID.
    * `count`
    * `page`
    * `limit`: The maximum number of items to return. Fewer than the requested number of items may be returned, even if the end of the list hasn't been reached.
    * `cursor`: Parameter for pagination. File comments are paginated for a single file. Set `cursor` equal to the `next_cursor` attribute returned by the previous request's `response_metadata`. This parameter is optional, but pagination is mandatory: the default value simply fetches the first "page" of the collection of comments. See [pagination](/docs/pagination) for more details.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/files.info)

  """
  @spec files_info(keyword) :: {:ok, map} | {:error, map}
  def files_info(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:count, :cursor, :file, :limit, :page, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Files, :files_info},
      url: "/files.info",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Files, :files_info_200_json_resp}},
        default: {SlackOpenApi.Web.Files, :files_info_default_json_resp}
      ],
      opts: opts
    })
  end

  @type files_list_200_json_resp :: %{
          files: [SlackOpenApi.Web.ObjsFile.t()],
          ok: true,
          paging: SlackOpenApi.Web.ObjsPaging.t()
        }

  @type files_list_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  get `/files.list`

  List for a team, in a channel, or from a user with applied filters.

  ## Options

    * `token`: Authentication token. Requires scope: `files:read`
    * `user`: Filter files created by a single user.
    * `channel`: Filter files appearing in a specific channel, indicated by its ID.
    * `ts_from`: Filter files created after this timestamp (inclusive).
    * `ts_to`: Filter files created before this timestamp (inclusive).
    * `types`: Filter files by type ([see below](#file_types)). You can pass multiple values in the types argument, like `types=spaces,snippets`.The default value is `all`, which does not filter the list.
    * `count`
    * `page`
    * `show_files_hidden_by_limit`: Show truncated file info for files hidden due to being too old, and the team who owns the file being over the file limit.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/files.list)

  """
  @spec files_list(keyword) :: {:ok, map} | {:error, map}
  def files_list(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :channel,
        :count,
        :page,
        :show_files_hidden_by_limit,
        :token,
        :ts_from,
        :ts_to,
        :types,
        :user
      ])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Files, :files_list},
      url: "/files.list",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Files, :files_list_200_json_resp}},
        default: {SlackOpenApi.Web.Files, :files_list_default_json_resp}
      ],
      opts: opts
    })
  end

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
      call: {SlackOpenApi.Web.Files, :files_remote_add},
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
      call: {SlackOpenApi.Web.Files, :files_remote_info},
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
      call: {SlackOpenApi.Web.Files, :files_remote_list},
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
      call: {SlackOpenApi.Web.Files, :files_remote_remove},
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
      call: {SlackOpenApi.Web.Files, :files_remote_share},
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
      call: {SlackOpenApi.Web.Files, :files_remote_update},
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

  @type files_revoke_public_url_200_json_resp :: %{file: SlackOpenApi.Web.ObjsFile.t(), ok: true}

  @type files_revoke_public_url_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  post `/files.revokePublicURL`

  Revokes public/external sharing access for a file

  ## Resources

    * [API method documentation](https://api.slack.com/methods/files.revokePublicURL)

  """
  @spec files_revoke_public_url(map, keyword) :: {:ok, map} | {:error, map}
  def files_revoke_public_url(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Files, :files_revoke_public_url},
      url: "/files.revokePublicURL",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Files, :files_revoke_public_url_200_json_resp}},
        default: {SlackOpenApi.Web.Files, :files_revoke_public_url_default_json_resp}
      ],
      opts: opts
    })
  end

  @type files_shared_public_url_200_json_resp :: %{file: SlackOpenApi.Web.ObjsFile.t(), ok: true}

  @type files_shared_public_url_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  post `/files.sharedPublicURL`

  Enables a file for public/external sharing.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/files.sharedPublicURL)

  """
  @spec files_shared_public_url(map, keyword) :: {:ok, map} | {:error, map}
  def files_shared_public_url(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Files, :files_shared_public_url},
      url: "/files.sharedPublicURL",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Files, :files_shared_public_url_200_json_resp}},
        default: {SlackOpenApi.Web.Files, :files_shared_public_url_default_json_resp}
      ],
      opts: opts
    })
  end

  @type files_upload_200_json_resp :: %{file: SlackOpenApi.Web.ObjsFile.t(), ok: true}

  @type files_upload_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  post `/files.upload`

  Uploads or creates a file.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/files.upload)

  """
  @spec files_upload(map, keyword) :: {:ok, map} | {:error, map}
  def files_upload(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Files, :files_upload},
      url: "/files.upload",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Files, :files_upload_200_json_resp}},
        default: {SlackOpenApi.Web.Files, :files_upload_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:files_delete_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:files_delete_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "file_not_found",
           "file_deleted",
           "cant_delete_file",
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
           "upgrade_required"
         ]},
      ok: {:const, false}
    ]
  end

  def __fields__(:files_info_200_json_resp) do
    [
      comments: [:map],
      content_html: :map,
      editor: {:string, :generic},
      file: {SlackOpenApi.Web.ObjsFile, :t},
      ok: {:const, true},
      paging: {SlackOpenApi.Web.ObjsPaging, :t},
      response_metadata: :map
    ]
  end

  def __fields__(:files_info_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "file_not_found",
           "file_deleted",
           "timezone_count_failed",
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
           "upgrade_required"
         ]},
      ok: {:const, false}
    ]
  end

  def __fields__(:files_list_200_json_resp) do
    [
      files: [{SlackOpenApi.Web.ObjsFile, :t}],
      ok: {:const, true},
      paging: {SlackOpenApi.Web.ObjsPaging, :t}
    ]
  end

  def __fields__(:files_list_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "user_not_found",
           "unknown_type",
           "not_authed",
           "invalid_auth",
           "account_inactive",
           "no_permission",
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
           "upgrade_required"
         ]},
      ok: {:const, false}
    ]
  end

  def __fields__(:files_revoke_public_url_200_json_resp) do
    [file: {SlackOpenApi.Web.ObjsFile, :t}, ok: {:const, true}]
  end

  def __fields__(:files_revoke_public_url_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "file_not_found",
           "not_authed",
           "invalid_auth",
           "account_inactive",
           "token_revoked",
           "no_permission",
           "org_login_required",
           "user_is_bot",
           "user_is_restricted",
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

  def __fields__(:files_shared_public_url_200_json_resp) do
    [file: {SlackOpenApi.Web.ObjsFile, :t}, ok: {:const, true}]
  end

  def __fields__(:files_shared_public_url_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "file_not_found",
           "not_allowed",
           "not_authed",
           "invalid_auth",
           "account_inactive",
           "token_revoked",
           "no_permission",
           "org_login_required",
           "user_is_bot",
           "user_is_restricted",
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

  def __fields__(:files_upload_200_json_resp) do
    [file: {SlackOpenApi.Web.ObjsFile, :t}, ok: {:const, true}]
  end

  def __fields__(:files_upload_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "posting_to_general_channel_denied",
           "invalid_channel",
           "file_uploads_disabled",
           "file_upload_size_restricted",
           "file_uploads_except_images_disabled",
           "storage_limit_reached",
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
           "upgrade_required"
         ]},
      ok: {:const, false}
    ]
  end
end
