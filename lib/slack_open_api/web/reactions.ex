defmodule SlackOpenApi.Web.Reactions do
  @moduledoc """
  Provides API endpoints related to reactions
  """

  @default_client SlackOpenApi.Client

  @type add_200_json_resp :: %{ok: true}

  @type add_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

  @doc """
  post `/reactions.add`

  Adds a reaction to an item.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/reactions.add)

  """
  @spec add(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Reactions.add_200_json_resp()}
          | {:error, SlackOpenApi.Web.Reactions.add_default_json_resp()}
  def add(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Reactions, :add},
      url: "/reactions.add",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Reactions, :add_200_json_resp}},
        default: {SlackOpenApi.Web.Reactions, :add_default_json_resp}
      ],
      opts: opts
    })
  end

  @type get_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

  @doc """
  get `/reactions.get`

  Gets reactions for an item.

  ## Options

    * `token`: Authentication token. Requires scope: `reactions:read`
    * `channel`: Channel where the message to get reactions for was posted.
    * `file`: File to get reactions for.
    * `file_comment`: File comment to get reactions for.
    * `full`: If true always return the complete reaction list.
    * `timestamp`: Timestamp of the message to get reactions for.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/reactions.get)

  """
  @spec get(opts :: keyword) ::
          {:ok, map} | {:error, SlackOpenApi.Web.Reactions.get_default_json_resp()}
  def get(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:channel, :file, :file_comment, :full, :timestamp, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Reactions, :get},
      url: "/reactions.get",
      method: :get,
      query: query,
      response: [{200, :map}, default: {SlackOpenApi.Web.Reactions, :get_default_json_resp}],
      opts: opts
    })
  end

  @type list_200_json_resp :: %{
          items: [map],
          ok: true,
          paging: SlackOpenApi.Web.ObjsPaging.t() | nil,
          response_metadata: map | nil
        }

  @type list_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

  @doc """
  get `/reactions.list`

  Lists reactions made by a user.

  ## Options

    * `token`: Authentication token. Requires scope: `reactions:read`
    * `user`: Show reactions made by this user. Defaults to the authed user.
    * `full`: If true always return the complete reaction list.
    * `count`
    * `page`
    * `cursor`: Parameter for pagination. Set `cursor` equal to the `next_cursor` attribute returned by the previous request's `response_metadata`. This parameter is optional, but pagination is mandatory: the default value simply fetches the first "page" of the collection. See [pagination](/docs/pagination) for more details.
    * `limit`: The maximum number of items to return. Fewer than the requested number of items may be returned, even if the end of the list hasn't been reached.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/reactions.list)

  """
  @spec list(opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Reactions.list_200_json_resp()}
          | {:error, SlackOpenApi.Web.Reactions.list_default_json_resp()}
  def list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:count, :cursor, :full, :limit, :page, :token, :user])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Reactions, :list},
      url: "/reactions.list",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Reactions, :list_200_json_resp}},
        default: {SlackOpenApi.Web.Reactions, :list_default_json_resp}
      ],
      opts: opts
    })
  end

  @type remove_200_json_resp :: %{ok: true}

  @type remove_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

  @doc """
  post `/reactions.remove`

  Removes a reaction from an item.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/reactions.remove)

  """
  @spec remove(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Reactions.remove_200_json_resp()}
          | {:error, SlackOpenApi.Web.Reactions.remove_default_json_resp()}
  def remove(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Reactions, :remove},
      url: "/reactions.remove",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Reactions, :remove_200_json_resp}},
        default: {SlackOpenApi.Web.Reactions, :remove_default_json_resp}
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
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "bad_timestamp",
           "message_not_found",
           "no_item_specified",
           "invalid_name",
           "already_reacted",
           "too_many_emoji",
           "too_many_reactions",
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

  def __fields__(:get_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "bad_timestamp",
           "file_not_found",
           "file_comment_not_found",
           "message_not_found",
           "no_item_specified",
           "not_authed",
           "invalid_auth",
           "account_inactive",
           "no_permission",
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
      items: [:map],
      ok: {:const, true},
      paging: {SlackOpenApi.Web.ObjsPaging, :t},
      response_metadata: :map
    ]
  end

  def __fields__(:list_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "user_not_found",
           "not_authed",
           "invalid_auth",
           "account_inactiv",
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
           "upgrade_required",
           "fatal_error"
         ]},
      ok: {:const, false}
    ]
  end

  def __fields__(:remove_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:remove_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "bad_timestamp",
           "file_not_found",
           "file_comment_not_found",
           "message_not_found",
           "no_item_specified",
           "invalid_name",
           "no_reaction",
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
           "upgrade_required",
           "fatal_error"
         ]},
      ok: {:const, false}
    ]
  end
end
