defmodule SlackOpenApi.Web.Stars do
  @moduledoc """
  Provides API endpoints related to stars
  """

  @default_client SlackOpenApi.Client

  @type stars_add_200_json_resp :: %{ok: true}

  @type stars_add_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  post `/stars.add`

  Adds a star to an item.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/stars.add)

  """
  @spec stars_add(map, keyword) :: {:ok, map} | {:error, map}
  def stars_add(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Stars, :stars_add},
      url: "/stars.add",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Stars, :stars_add_200_json_resp}},
        default: {SlackOpenApi.Web.Stars, :stars_add_default_json_resp}
      ],
      opts: opts
    })
  end

  @type stars_list_200_json_resp :: %{
          items: [map],
          ok: true,
          paging: SlackOpenApi.Web.ObjsPaging.t() | nil
        }

  @type stars_list_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  get `/stars.list`

  Lists stars for a user.

  ## Options

    * `token`: Authentication token. Requires scope: `stars:read`
    * `count`
    * `page`
    * `cursor`: Parameter for pagination. Set `cursor` equal to the `next_cursor` attribute returned by the previous request's `response_metadata`. This parameter is optional, but pagination is mandatory: the default value simply fetches the first "page" of the collection. See [pagination](/docs/pagination) for more details.
    * `limit`: The maximum number of items to return. Fewer than the requested number of items may be returned, even if the end of the list hasn't been reached.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/stars.list)

  """
  @spec stars_list(keyword) :: {:ok, map} | {:error, map}
  def stars_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:count, :cursor, :limit, :page, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Stars, :stars_list},
      url: "/stars.list",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Stars, :stars_list_200_json_resp}},
        default: {SlackOpenApi.Web.Stars, :stars_list_default_json_resp}
      ],
      opts: opts
    })
  end

  @type stars_remove_200_json_resp :: %{ok: true}

  @type stars_remove_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  post `/stars.remove`

  Removes a star from an item.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/stars.remove)

  """
  @spec stars_remove(map, keyword) :: {:ok, map} | {:error, map}
  def stars_remove(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Stars, :stars_remove},
      url: "/stars.remove",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Stars, :stars_remove_200_json_resp}},
        default: {SlackOpenApi.Web.Stars, :stars_remove_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:stars_add_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:stars_add_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "bad_timestamp",
           "message_not_found",
           "file_not_found",
           "file_comment_not_found",
           "channel_not_found",
           "no_item_specified",
           "already_starred",
           "not_authed",
           "invalid_auth",
           "account_inactive",
           "token_revoked",
           "no_permission",
           "org_login_required",
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

  def __fields__(:stars_list_200_json_resp) do
    [items: [:map], ok: {:const, true}, paging: {SlackOpenApi.Web.ObjsPaging, :t}]
  end

  def __fields__(:stars_list_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "not_authed",
           "invalid_auth",
           "account_inactive",
           "token_revoked",
           "no_permission",
           "org_login_required",
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
           "upgrade_required",
           "fatal_error"
         ]},
      ok: {:const, false}
    ]
  end

  def __fields__(:stars_remove_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:stars_remove_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "bad_timestamp",
           "message_not_found",
           "file_not_found",
           "file_comment_not_found",
           "channel_not_found",
           "no_item_specified",
           "not_starred",
           "not_authed",
           "invalid_auth",
           "account_inactive",
           "token_revoked",
           "no_permission",
           "org_login_required",
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
end
