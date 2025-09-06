defmodule SlackOpenApi.Web.Files do
  @moduledoc """
  Provides API endpoints related to files
  """

  @default_client SlackOpenApi.Client

  @type delete_200_json_resp :: %{ok: true}

  @type delete_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

  @doc """
  post `/files.delete`

  Deletes a file.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/files.delete)

  """
  @spec delete(map, keyword) :: {:ok, map} | {:error, map}
  def delete(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Files, :delete},
      url: "/files.delete",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Files, :delete_200_json_resp}},
        default: {SlackOpenApi.Web.Files, :delete_default_json_resp}
      ],
      opts: opts
    })
  end

  @type info_200_json_resp :: %{
          comments: [map],
          content_html: map | nil,
          editor: String.t() | nil,
          file: SlackOpenApi.Web.ObjsFile.t(),
          ok: true,
          paging: SlackOpenApi.Web.ObjsPaging.t() | nil,
          response_metadata: map | nil
        }

  @type info_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

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
  @spec info(keyword) :: {:ok, map} | {:error, map}
  def info(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:count, :cursor, :file, :limit, :page, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Files, :info},
      url: "/files.info",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Files, :info_200_json_resp}},
        default: {SlackOpenApi.Web.Files, :info_default_json_resp}
      ],
      opts: opts
    })
  end

  @type list_200_json_resp :: %{
          files: [SlackOpenApi.Web.ObjsFile.t()],
          ok: true,
          paging: SlackOpenApi.Web.ObjsPaging.t()
        }

  @type list_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

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
  @spec list(keyword) :: {:ok, map} | {:error, map}
  def list(opts \\ []) do
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
      call: {SlackOpenApi.Web.Files, :list},
      url: "/files.list",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Files, :list_200_json_resp}},
        default: {SlackOpenApi.Web.Files, :list_default_json_resp}
      ],
      opts: opts
    })
  end

  @type revoke_public_u_r_l_200_json_resp :: %{file: SlackOpenApi.Web.ObjsFile.t(), ok: true}

  @type revoke_public_u_r_l_default_json_resp :: %{
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
  @spec revoke_public_u_r_l(map, keyword) :: {:ok, map} | {:error, map}
  def revoke_public_u_r_l(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Files, :revoke_public_u_r_l},
      url: "/files.revokePublicURL",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Files, :revoke_public_u_r_l_200_json_resp}},
        default: {SlackOpenApi.Web.Files, :revoke_public_u_r_l_default_json_resp}
      ],
      opts: opts
    })
  end

  @type shared_public_u_r_l_200_json_resp :: %{file: SlackOpenApi.Web.ObjsFile.t(), ok: true}

  @type shared_public_u_r_l_default_json_resp :: %{
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
  @spec shared_public_u_r_l(map, keyword) :: {:ok, map} | {:error, map}
  def shared_public_u_r_l(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Files, :shared_public_u_r_l},
      url: "/files.sharedPublicURL",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Files, :shared_public_u_r_l_200_json_resp}},
        default: {SlackOpenApi.Web.Files, :shared_public_u_r_l_default_json_resp}
      ],
      opts: opts
    })
  end

  @type upload_200_json_resp :: %{file: SlackOpenApi.Web.ObjsFile.t(), ok: true}

  @type upload_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

  @doc """
  post `/files.upload`

  Uploads or creates a file.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/files.upload)

  """
  @spec upload(map, keyword) :: {:ok, map} | {:error, map}
  def upload(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Files, :upload},
      url: "/files.upload",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Files, :upload_200_json_resp}},
        default: {SlackOpenApi.Web.Files, :upload_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:delete_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:delete_default_json_resp) do
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

  def __fields__(:info_200_json_resp) do
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

  def __fields__(:info_default_json_resp) do
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

  def __fields__(:list_200_json_resp) do
    [
      files: [{SlackOpenApi.Web.ObjsFile, :t}],
      ok: {:const, true},
      paging: {SlackOpenApi.Web.ObjsPaging, :t}
    ]
  end

  def __fields__(:list_default_json_resp) do
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

  def __fields__(:revoke_public_u_r_l_200_json_resp) do
    [file: {SlackOpenApi.Web.ObjsFile, :t}, ok: {:const, true}]
  end

  def __fields__(:revoke_public_u_r_l_default_json_resp) do
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

  def __fields__(:shared_public_u_r_l_200_json_resp) do
    [file: {SlackOpenApi.Web.ObjsFile, :t}, ok: {:const, true}]
  end

  def __fields__(:shared_public_u_r_l_default_json_resp) do
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

  def __fields__(:upload_200_json_resp) do
    [file: {SlackOpenApi.Web.ObjsFile, :t}, ok: {:const, true}]
  end

  def __fields__(:upload_default_json_resp) do
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
