defmodule SlackOpenApi.Web.Conversations do
  @moduledoc """
  Provides API endpoints related to conversations
  """

  @default_client SlackOpenApi.Client

  @type archive_200_json_resp :: %{ok: true}

  @type archive_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          needed: String.t() | nil,
          ok: false,
          provided: String.t() | nil
        }

  @doc """
  post `/conversations.archive`

  Archives a conversation.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/conversations.archive)

  """
  @spec archive(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Conversations.archive_200_json_resp()}
          | {:error, SlackOpenApi.Web.Conversations.archive_default_json_resp()}
  def archive(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Conversations, :archive},
      url: "/conversations.archive",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Conversations, :archive_200_json_resp}},
        default: {SlackOpenApi.Web.Conversations, :archive_default_json_resp}
      ],
      opts: opts
    })
  end

  @type close_200_json_resp :: %{already_closed: boolean | nil, no_op: boolean | nil, ok: true}

  @type close_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          needed: String.t() | nil,
          ok: false,
          provided: String.t() | nil
        }

  @doc """
  post `/conversations.close`

  Closes a direct message or multi-person direct message.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/conversations.close)

  """
  @spec close(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Conversations.close_200_json_resp()}
          | {:error, SlackOpenApi.Web.Conversations.close_default_json_resp()}
  def close(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Conversations, :close},
      url: "/conversations.close",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Conversations, :close_200_json_resp}},
        default: {SlackOpenApi.Web.Conversations, :close_default_json_resp}
      ],
      opts: opts
    })
  end

  @type create_200_json_resp :: %{channel: map, ok: true}

  @type create_default_json_resp :: %{
          callstack: String.t() | nil,
          detail: String.t() | nil,
          error: String.t(),
          needed: String.t() | nil,
          ok: false,
          provided: String.t() | nil
        }

  @doc """
  post `/conversations.create`

  Initiates a public or private channel-based conversation

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/conversations.create)

  """
  @spec create(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Conversations.create_200_json_resp()}
          | {:error, SlackOpenApi.Web.Conversations.create_default_json_resp()}
  def create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Conversations, :create},
      url: "/conversations.create",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Conversations, :create_200_json_resp}},
        default: {SlackOpenApi.Web.Conversations, :create_default_json_resp}
      ],
      opts: opts
    })
  end

  @type history_200_json_resp :: %{
          channel_actions_count: integer,
          channel_actions_ts: map,
          has_more: boolean,
          messages: [SlackOpenApi.Web.ObjsMessage.t()],
          ok: true,
          pin_count: integer
        }

  @type history_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          needed: String.t() | nil,
          ok: false,
          provided: String.t() | nil
        }

  @doc """
  get `/conversations.history`

  Fetches a conversation's history of messages and events.

  ## Options

    * `token`: Authentication token. Requires scope: `conversations:history`
    * `channel`: Conversation ID to fetch history for.
    * `latest`: End of time range of messages to include in results.
    * `oldest`: Start of time range of messages to include in results.
    * `inclusive`: Include messages with latest or oldest timestamp in results only when either timestamp is specified.
    * `limit`: The maximum number of items to return. Fewer than the requested number of items may be returned, even if the end of the users list hasn't been reached.
    * `cursor`: Paginate through collections of data by setting the `cursor` parameter to a `next_cursor` attribute returned by a previous request's `response_metadata`. Default value fetches the first "page" of the collection. See [pagination](/docs/pagination) for more detail.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/conversations.history)

  """
  @spec history(opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Conversations.history_200_json_resp()}
          | {:error, SlackOpenApi.Web.Conversations.history_default_json_resp()}
  def history(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:channel, :cursor, :inclusive, :latest, :limit, :oldest, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Conversations, :history},
      url: "/conversations.history",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Conversations, :history_200_json_resp}},
        default: {SlackOpenApi.Web.Conversations, :history_default_json_resp}
      ],
      opts: opts
    })
  end

  @type info_200_json_resp :: %{channel: map, ok: true}

  @type info_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          needed: String.t() | nil,
          ok: false,
          provided: String.t() | nil
        }

  @doc """
  get `/conversations.info`

  Retrieve information about a conversation.

  ## Options

    * `token`: Authentication token. Requires scope: `conversations:read`
    * `channel`: Conversation ID to learn more about
    * `include_locale`: Set this to `true` to receive the locale for this conversation. Defaults to `false`
    * `include_num_members`: Set to `true` to include the member count for the specified conversation. Defaults to `false`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/conversations.info)

  """
  @spec info(opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Conversations.info_200_json_resp()}
          | {:error, SlackOpenApi.Web.Conversations.info_default_json_resp()}
  def info(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:channel, :include_locale, :include_num_members, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Conversations, :info},
      url: "/conversations.info",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Conversations, :info_200_json_resp}},
        default: {SlackOpenApi.Web.Conversations, :info_default_json_resp}
      ],
      opts: opts
    })
  end

  @type invite_200_json_resp :: %{channel: map, ok: true}

  @type invite_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t() | nil,
          errors: [SlackOpenApi.Web.Conversations.invite_default_json_resp_errors()] | nil,
          needed: String.t() | nil,
          ok: false,
          provided: String.t() | nil
        }

  @type invite_default_json_resp_errors :: %{error: String.t(), ok: false, user: String.t() | nil}

  @doc """
  post `/conversations.invite`

  Invites users to a channel.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/conversations.invite)

  """
  @spec invite(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Conversations.invite_200_json_resp()}
          | {:error, SlackOpenApi.Web.Conversations.invite_default_json_resp()}
  def invite(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Conversations, :invite},
      url: "/conversations.invite",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Conversations, :invite_200_json_resp}},
        default: {SlackOpenApi.Web.Conversations, :invite_default_json_resp}
      ],
      opts: opts
    })
  end

  @type join_200_json_resp :: %{
          channel: map,
          ok: true,
          response_metadata: SlackOpenApi.Web.ResponseMetadata.t() | nil,
          warning: String.t() | nil
        }

  @type join_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          needed: String.t() | nil,
          ok: false,
          provided: String.t() | nil
        }

  @doc """
  post `/conversations.join`

  Joins an existing conversation.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/conversations.join)

  """
  @spec join(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Conversations.join_200_json_resp()}
          | {:error, SlackOpenApi.Web.Conversations.join_default_json_resp()}
  def join(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Conversations, :join},
      url: "/conversations.join",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Conversations, :join_200_json_resp}},
        default: {SlackOpenApi.Web.Conversations, :join_default_json_resp}
      ],
      opts: opts
    })
  end

  @type kick_200_json_resp :: %{ok: true}

  @type kick_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          needed: String.t() | nil,
          ok: false,
          provided: String.t() | nil
        }

  @doc """
  post `/conversations.kick`

  Removes a user from a conversation.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/conversations.kick)

  """
  @spec kick(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Conversations.kick_200_json_resp()}
          | {:error, SlackOpenApi.Web.Conversations.kick_default_json_resp()}
  def kick(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Conversations, :kick},
      url: "/conversations.kick",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Conversations, :kick_200_json_resp}},
        default: {SlackOpenApi.Web.Conversations, :kick_default_json_resp}
      ],
      opts: opts
    })
  end

  @type leave_200_json_resp :: %{not_in_channel: true | nil, ok: true}

  @type leave_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          needed: String.t() | nil,
          ok: false,
          provided: String.t() | nil
        }

  @doc """
  post `/conversations.leave`

  Leaves a conversation.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/conversations.leave)

  """
  @spec leave(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Conversations.leave_200_json_resp()}
          | {:error, SlackOpenApi.Web.Conversations.leave_default_json_resp()}
  def leave(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Conversations, :leave},
      url: "/conversations.leave",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Conversations, :leave_200_json_resp}},
        default: {SlackOpenApi.Web.Conversations, :leave_default_json_resp}
      ],
      opts: opts
    })
  end

  @type list_200_json_resp :: %{
          channels: [map],
          ok: true,
          response_metadata:
            SlackOpenApi.Web.Conversations.list_200_json_resp_response_metadata() | nil
        }

  @type list_200_json_resp_response_metadata :: %{next_cursor: String.t()}

  @type list_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          needed: String.t() | nil,
          ok: false,
          provided: String.t() | nil
        }

  @doc """
  get `/conversations.list`

  Lists all channels in a Slack team.

  ## Options

    * `token`: Authentication token. Requires scope: `conversations:read`
    * `exclude_archived`: Set to `true` to exclude archived channels from the list
    * `types`: Mix and match channel types by providing a comma-separated list of any combination of `public_channel`, `private_channel`, `mpim`, `im`
    * `limit`: The maximum number of items to return. Fewer than the requested number of items may be returned, even if the end of the list hasn't been reached. Must be an integer no larger than 1000.
    * `cursor`: Paginate through collections of data by setting the `cursor` parameter to a `next_cursor` attribute returned by a previous request's `response_metadata`. Default value fetches the first "page" of the collection. See [pagination](/docs/pagination) for more detail.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/conversations.list)

  """
  @spec list(opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Conversations.list_200_json_resp()}
          | {:error, SlackOpenApi.Web.Conversations.list_default_json_resp()}
  def list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:cursor, :exclude_archived, :limit, :token, :types])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Conversations, :list},
      url: "/conversations.list",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Conversations, :list_200_json_resp}},
        default: {SlackOpenApi.Web.Conversations, :list_default_json_resp}
      ],
      opts: opts
    })
  end

  @type mark_200_json_resp :: %{ok: true}

  @type mark_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          needed: String.t() | nil,
          ok: false,
          provided: String.t() | nil
        }

  @doc """
  post `/conversations.mark`

  Sets the read cursor in a channel.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/conversations.mark)

  """
  @spec mark(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Conversations.mark_200_json_resp()}
          | {:error, SlackOpenApi.Web.Conversations.mark_default_json_resp()}
  def mark(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Conversations, :mark},
      url: "/conversations.mark",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Conversations, :mark_200_json_resp}},
        default: {SlackOpenApi.Web.Conversations, :mark_default_json_resp}
      ],
      opts: opts
    })
  end

  @type members_200_json_resp :: %{
          members: [String.t()],
          ok: true,
          response_metadata:
            SlackOpenApi.Web.Conversations.members_200_json_resp_response_metadata()
        }

  @type members_200_json_resp_response_metadata :: %{next_cursor: String.t()}

  @type members_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

  @doc """
  get `/conversations.members`

  Retrieve members of a conversation.

  ## Options

    * `token`: Authentication token. Requires scope: `conversations:read`
    * `channel`: ID of the conversation to retrieve members for
    * `limit`: The maximum number of items to return. Fewer than the requested number of items may be returned, even if the end of the users list hasn't been reached.
    * `cursor`: Paginate through collections of data by setting the `cursor` parameter to a `next_cursor` attribute returned by a previous request's `response_metadata`. Default value fetches the first "page" of the collection. See [pagination](/docs/pagination) for more detail.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/conversations.members)

  """
  @spec members(opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Conversations.members_200_json_resp()}
          | {:error, SlackOpenApi.Web.Conversations.members_default_json_resp()}
  def members(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:channel, :cursor, :limit, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Conversations, :members},
      url: "/conversations.members",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Conversations, :members_200_json_resp}},
        default: {SlackOpenApi.Web.Conversations, :members_default_json_resp}
      ],
      opts: opts
    })
  end

  @type open_200_json_resp :: %{
          already_open: boolean | nil,
          channel: map,
          no_op: boolean | nil,
          ok: true
        }

  @type open_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

  @doc """
  post `/conversations.open`

  Opens or resumes a direct message or multi-person direct message.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/conversations.open)

  """
  @spec open(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Conversations.open_200_json_resp()}
          | {:error, SlackOpenApi.Web.Conversations.open_default_json_resp()}
  def open(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Conversations, :open},
      url: "/conversations.open",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Conversations, :open_200_json_resp}},
        default: {SlackOpenApi.Web.Conversations, :open_default_json_resp}
      ],
      opts: opts
    })
  end

  @type rename_200_json_resp :: %{channel: map, ok: true}

  @type rename_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          needed: String.t() | nil,
          ok: false,
          provided: String.t() | nil
        }

  @doc """
  post `/conversations.rename`

  Renames a conversation.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/conversations.rename)

  """
  @spec rename(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Conversations.rename_200_json_resp()}
          | {:error, SlackOpenApi.Web.Conversations.rename_default_json_resp()}
  def rename(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Conversations, :rename},
      url: "/conversations.rename",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Conversations, :rename_200_json_resp}},
        default: {SlackOpenApi.Web.Conversations, :rename_default_json_resp}
      ],
      opts: opts
    })
  end

  @type replies_200_json_resp :: %{has_more: boolean | nil, messages: [map], ok: true}

  @type replies_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          needed: String.t() | nil,
          ok: false,
          provided: String.t() | nil
        }

  @doc """
  get `/conversations.replies`

  Retrieve a thread of messages posted to a conversation

  ## Options

    * `token`: Authentication token. Requires scope: `conversations:history`
    * `channel`: Conversation ID to fetch thread from.
    * `ts`: Unique identifier of a thread's parent message. `ts` must be the timestamp of an existing message with 0 or more replies. If there are no replies then just the single message referenced by `ts` will return - it is just an ordinary, unthreaded message.
    * `latest`: End of time range of messages to include in results.
    * `oldest`: Start of time range of messages to include in results.
    * `inclusive`: Include messages with latest or oldest timestamp in results only when either timestamp is specified.
    * `limit`: The maximum number of items to return. Fewer than the requested number of items may be returned, even if the end of the users list hasn't been reached.
    * `cursor`: Paginate through collections of data by setting the `cursor` parameter to a `next_cursor` attribute returned by a previous request's `response_metadata`. Default value fetches the first "page" of the collection. See [pagination](/docs/pagination) for more detail.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/conversations.replies)

  """
  @spec replies(opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Conversations.replies_200_json_resp()}
          | {:error, SlackOpenApi.Web.Conversations.replies_default_json_resp()}
  def replies(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:channel, :cursor, :inclusive, :latest, :limit, :oldest, :token, :ts])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Conversations, :replies},
      url: "/conversations.replies",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Conversations, :replies_200_json_resp}},
        default: {SlackOpenApi.Web.Conversations, :replies_default_json_resp}
      ],
      opts: opts
    })
  end

  @type set_purpose_200_json_resp :: %{channel: map, ok: true}

  @type set_purpose_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          needed: String.t() | nil,
          ok: false,
          provided: String.t() | nil
        }

  @doc """
  post `/conversations.setPurpose`

  Sets the purpose for a conversation.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/conversations.setPurpose)

  """
  @spec set_purpose(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Conversations.set_purpose_200_json_resp()}
          | {:error, SlackOpenApi.Web.Conversations.set_purpose_default_json_resp()}
  def set_purpose(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Conversations, :set_purpose},
      url: "/conversations.setPurpose",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Conversations, :set_purpose_200_json_resp}},
        default: {SlackOpenApi.Web.Conversations, :set_purpose_default_json_resp}
      ],
      opts: opts
    })
  end

  @type set_topic_200_json_resp :: %{channel: map, ok: true}

  @type set_topic_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          needed: String.t() | nil,
          ok: false,
          provided: String.t() | nil
        }

  @doc """
  post `/conversations.setTopic`

  Sets the topic for a conversation.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/conversations.setTopic)

  """
  @spec set_topic(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Conversations.set_topic_200_json_resp()}
          | {:error, SlackOpenApi.Web.Conversations.set_topic_default_json_resp()}
  def set_topic(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Conversations, :set_topic},
      url: "/conversations.setTopic",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Conversations, :set_topic_200_json_resp}},
        default: {SlackOpenApi.Web.Conversations, :set_topic_default_json_resp}
      ],
      opts: opts
    })
  end

  @type unarchive_200_json_resp :: %{ok: true}

  @type unarchive_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          needed: String.t() | nil,
          ok: false,
          provided: String.t() | nil
        }

  @doc """
  post `/conversations.unarchive`

  Reverses conversation archival.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/conversations.unarchive)

  """
  @spec unarchive(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Conversations.unarchive_200_json_resp()}
          | {:error, SlackOpenApi.Web.Conversations.unarchive_default_json_resp()}
  def unarchive(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Conversations, :unarchive},
      url: "/conversations.unarchive",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Conversations, :unarchive_200_json_resp}},
        default: {SlackOpenApi.Web.Conversations, :unarchive_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:archive_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:archive_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "method_not_supported_for_channel_type",
           "missing_scope",
           "not_supported",
           "channel_not_found",
           "already_archived",
           "cant_archive_general",
           "restricted_action",
           "not_authed",
           "invalid_auth",
           "account_inactive",
           "user_is_bot",
           "user_is_restricted",
           "user_is_ultra_restricted",
           "invalid_arg_name",
           "invalid_array_arg",
           "invalid_charset",
           "invalid_form_data",
           "invalid_post_type",
           "missing_post_type",
           "invalid_json",
           "json_not_object",
           "request_timeout",
           "upgrade_required",
           "team_added_to_org",
           "missing_charset",
           "superfluous_charset"
         ]},
      needed: {:string, :generic},
      ok: {:const, false},
      provided: {:string, :generic}
    ]
  end

  def __fields__(:close_200_json_resp) do
    [already_closed: :boolean, no_op: :boolean, ok: {:const, true}]
  end

  def __fields__(:close_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "method_not_supported_for_channel_type",
           "channel_not_found",
           "user_does_not_own_channel",
           "missing_scope",
           "not_authed",
           "invalid_auth",
           "account_inactive",
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
      needed: {:string, :generic},
      ok: {:const, false},
      provided: {:string, :generic}
    ]
  end

  def __fields__(:create_200_json_resp) do
    [channel: :map, ok: {:const, true}]
  end

  def __fields__(:create_default_json_resp) do
    [
      callstack: {:string, :generic},
      detail: {:string, :generic},
      error:
        {:enum,
         [
           "method_not_supported_for_channel_type",
           "missing_scope",
           "name_taken",
           "restricted_action",
           "no_channel",
           "invalid_name_required",
           "invalid_name_punctuation",
           "invalid_name_maxlength",
           "invalid_name_specials",
           "invalid_name",
           "not_authed",
           "invalid_auth",
           "account_inactive",
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
           "upgrade_required"
         ]},
      needed: {:string, :generic},
      ok: {:const, false},
      provided: {:string, :generic}
    ]
  end

  def __fields__(:history_200_json_resp) do
    [
      channel_actions_count: :integer,
      channel_actions_ts: :map,
      has_more: :boolean,
      messages: [{SlackOpenApi.Web.ObjsMessage, :t}],
      ok: {:const, true},
      pin_count: :integer
    ]
  end

  def __fields__(:history_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "missing_scope",
           "channel_not_found",
           "invalid_ts_latest",
           "invalid_ts_oldest",
           "not_authed",
           "invalid_auth",
           "account_inactive",
           "invalid_arg_name",
           "invalid_array_arg",
           "invalid_charset",
           "invalid_form_data",
           "invalid_post_type",
           "missing_post_type",
           "invalid_json",
           "json_not_object",
           "request_timeout",
           "upgrade_required"
         ]},
      needed: {:string, :generic},
      ok: {:const, false},
      provided: {:string, :generic}
    ]
  end

  def __fields__(:info_200_json_resp) do
    [channel: :map, ok: {:const, true}]
  end

  def __fields__(:info_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "missing_scope",
           "channel_not_found",
           "team_added_to_org",
           "not_authed",
           "invalid_auth",
           "account_inactive",
           "invalid_arg_name",
           "invalid_array_arg",
           "invalid_charset",
           "invalid_form_data",
           "invalid_post_type",
           "missing_post_type",
           "invalid_json",
           "json_not_object",
           "request_timeout",
           "upgrade_required"
         ]},
      needed: {:string, :generic},
      ok: {:const, false},
      provided: {:string, :generic}
    ]
  end

  def __fields__(:invite_200_json_resp) do
    [channel: :map, ok: {:const, true}]
  end

  def __fields__(:invite_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "method_not_supported_for_channel_type",
           "missing_scope",
           "channel_not_found",
           "user_not_found",
           "no_user",
           "cant_invite_self",
           "not_in_channel",
           "already_in_channel",
           "is_archived",
           "cant_invite",
           "too_many_users",
           "ura_max_channels",
           "not_authed",
           "invalid_auth",
           "account_inactive",
           "user_is_bot",
           "user_is_restricted",
           "user_is_ultra_restricted",
           "invalid_arg_name",
           "invalid_array_arg",
           "invalid_charset",
           "invalid_form_data",
           "invalid_post_type",
           "missing_post_type",
           "invalid_json",
           "json_not_object",
           "request_timeout",
           "upgrade_required",
           "team_added_to_org",
           "missing_charset",
           "superfluous_charset"
         ]},
      errors: [{SlackOpenApi.Web.Conversations, :invite_default_json_resp_errors}],
      needed: {:string, :generic},
      ok: {:const, false},
      provided: {:string, :generic}
    ]
  end

  def __fields__(:invite_default_json_resp_errors) do
    [
      error:
        {:enum,
         [
           "method_not_supported_for_channel_type",
           "missing_scope",
           "channel_not_found",
           "user_not_found",
           "no_user",
           "cant_invite_self",
           "not_in_channel",
           "already_in_channel",
           "is_archived",
           "cant_invite",
           "too_many_users",
           "ura_max_channels",
           "not_authed",
           "invalid_auth",
           "account_inactive",
           "user_is_bot",
           "user_is_restricted",
           "user_is_ultra_restricted",
           "invalid_arg_name",
           "invalid_array_arg",
           "invalid_charset",
           "invalid_form_data",
           "invalid_post_type",
           "missing_post_type",
           "invalid_json",
           "json_not_object",
           "request_timeout",
           "upgrade_required",
           "team_added_to_org",
           "missing_charset",
           "superfluous_charset"
         ]},
      ok: {:const, false},
      user: {:string, :generic}
    ]
  end

  def __fields__(:join_200_json_resp) do
    [
      channel: :map,
      ok: {:const, true},
      response_metadata: {SlackOpenApi.Web.ResponseMetadata, :t},
      warning: {:string, :generic}
    ]
  end

  def __fields__(:join_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "method_not_supported_for_channel_type",
           "missing_scope",
           "channel_not_found",
           "is_archived",
           "not_authed",
           "invalid_auth",
           "account_inactive",
           "user_is_bot",
           "user_is_restricted",
           "user_is_ultra_restricted",
           "invalid_arg_name",
           "invalid_array_arg",
           "invalid_charset",
           "invalid_form_data",
           "invalid_post_type",
           "missing_post_type",
           "invalid_json",
           "json_not_object",
           "request_timeout",
           "upgrade_required",
           "team_added_to_org",
           "missing_charset",
           "superfluous_charset"
         ]},
      needed: {:string, :generic},
      ok: {:const, false},
      provided: {:string, :generic}
    ]
  end

  def __fields__(:kick_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:kick_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "method_not_supported_for_channel_type",
           "missing_scope",
           "channel_not_found",
           "user_not_found",
           "cant_kick_self",
           "not_in_channel",
           "cant_kick_from_general",
           "restricted_action",
           "not_authed",
           "invalid_auth",
           "account_inactive",
           "user_is_bot",
           "user_is_restricted",
           "invalid_arg_name",
           "invalid_array_arg",
           "invalid_charset",
           "invalid_form_data",
           "invalid_post_type",
           "missing_post_type",
           "invalid_json",
           "json_not_object",
           "request_timeout",
           "upgrade_required"
         ]},
      needed: {:string, :generic},
      ok: {:const, false},
      provided: {:string, :generic}
    ]
  end

  def __fields__(:leave_200_json_resp) do
    [not_in_channel: {:const, true}, ok: {:const, true}]
  end

  def __fields__(:leave_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "method_not_supported_for_channel_type",
           "last_member",
           "missing_scope",
           "channel_not_found",
           "is_archived",
           "cant_leave_general",
           "not_authed",
           "invalid_auth",
           "account_inactive",
           "user_is_bot",
           "user_is_restricted",
           "user_is_ultra_restricted",
           "invalid_arg_name",
           "invalid_array_arg",
           "invalid_charset",
           "invalid_form_data",
           "invalid_post_type",
           "missing_post_type",
           "invalid_json",
           "json_not_object",
           "request_timeout",
           "upgrade_required",
           "team_added_to_org",
           "missing_charset",
           "superfluous_charset"
         ]},
      needed: {:string, :generic},
      ok: {:const, false},
      provided: {:string, :generic}
    ]
  end

  def __fields__(:list_200_json_resp) do
    [
      channels: [:map],
      ok: {:const, true},
      response_metadata: {SlackOpenApi.Web.Conversations, :list_200_json_resp_response_metadata}
    ]
  end

  def __fields__(:list_200_json_resp_response_metadata) do
    [next_cursor: {:string, :generic}]
  end

  def __fields__(:list_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "missing_scope",
           "not_authed",
           "invalid_auth",
           "account_inactive",
           "invalid_arg_name",
           "invalid_array_arg",
           "invalid_charset",
           "invalid_form_data",
           "invalid_post_type",
           "missing_post_type",
           "invalid_json",
           "json_not_object",
           "request_timeout",
           "upgrade_required"
         ]},
      needed: {:string, :generic},
      ok: {:const, false},
      provided: {:string, :generic}
    ]
  end

  def __fields__(:mark_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:mark_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "method_not_supported_for_channel_type",
           "missing_scope",
           "channel_not_found",
           "invalid_timestamp",
           "not_in_channel",
           "not_authed",
           "invalid_auth",
           "account_inactive",
           "invalid_arg_name",
           "invalid_array_arg",
           "invalid_charset",
           "invalid_form_data",
           "invalid_post_type",
           "missing_post_type",
           "invalid_json",
           "json_not_object",
           "request_timeout",
           "upgrade_required",
           "not_allowed_token_type"
         ]},
      needed: {:string, :generic},
      ok: {:const, false},
      provided: {:string, :generic}
    ]
  end

  def __fields__(:members_200_json_resp) do
    [
      members: [string: :generic],
      ok: {:const, true},
      response_metadata:
        {SlackOpenApi.Web.Conversations, :members_200_json_resp_response_metadata}
    ]
  end

  def __fields__(:members_200_json_resp_response_metadata) do
    [next_cursor: {:string, :generic}]
  end

  def __fields__(:members_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "channel_not_found",
           "invalid_limit",
           "invalid_cursor",
           "fetch_members_failed",
           "not_authed",
           "invalid_auth",
           "account_inactive",
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

  def __fields__(:open_200_json_resp) do
    [already_open: :boolean, channel: :map, no_op: :boolean, ok: {:const, true}]
  end

  def __fields__(:open_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "method_not_supported_for_channel_type",
           "user_not_found",
           "user_not_visible",
           "user_disabled",
           "users_list_not_supplied",
           "not_enough_users",
           "too_many_users",
           "invalid_user_combination",
           "not_authed",
           "invalid_auth",
           "account_inactive",
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
           "channel_not_found"
         ]},
      ok: {:const, false}
    ]
  end

  def __fields__(:rename_200_json_resp) do
    [channel: :map, ok: {:const, true}]
  end

  def __fields__(:rename_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "user_is_restricted",
           "method_not_supported_for_channel_type",
           "missing_scope",
           "channel_not_found",
           "not_in_channel",
           "not_authorized",
           "invalid_name",
           "name_taken",
           "invalid_name_required",
           "invalid_name_punctuation",
           "invalid_name_maxlength",
           "invalid_name_specials",
           "not_authed",
           "invalid_auth",
           "account_inactive",
           "invalid_arg_name",
           "invalid_array_arg",
           "invalid_charset",
           "invalid_form_data",
           "invalid_post_type",
           "missing_post_type",
           "invalid_json",
           "json_not_object",
           "request_timeout",
           "upgrade_required"
         ]},
      needed: {:string, :generic},
      ok: {:const, false},
      provided: {:string, :generic}
    ]
  end

  def __fields__(:replies_200_json_resp) do
    [has_more: :boolean, messages: [:map], ok: {:const, true}]
  end

  def __fields__(:replies_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "missing_scope",
           "channel_not_found",
           "thread_not_found",
           "not_authed",
           "invalid_auth",
           "account_inactive",
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
      needed: {:string, :generic},
      ok: {:const, false},
      provided: {:string, :generic}
    ]
  end

  def __fields__(:set_purpose_200_json_resp) do
    [channel: :map, ok: {:const, true}]
  end

  def __fields__(:set_purpose_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "method_not_supported_for_channel_type",
           "missing_scope",
           "channel_not_found",
           "not_in_channel",
           "is_archived",
           "too_long",
           "user_is_restricted",
           "not_authed",
           "invalid_auth",
           "account_inactive",
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
      needed: {:string, :generic},
      ok: {:const, false},
      provided: {:string, :generic}
    ]
  end

  def __fields__(:set_topic_200_json_resp) do
    [channel: :map, ok: {:const, true}]
  end

  def __fields__(:set_topic_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "method_not_supported_for_channel_type",
           "missing_scope",
           "channel_not_found",
           "not_in_channel",
           "is_archived",
           "too_long",
           "user_is_restricted",
           "not_authed",
           "invalid_auth",
           "account_inactive",
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
      needed: {:string, :generic},
      ok: {:const, false},
      provided: {:string, :generic}
    ]
  end

  def __fields__(:unarchive_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:unarchive_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "method_not_supported_for_channel_type",
           "missing_scope",
           "channel_not_found",
           "not_archived",
           "not_authed",
           "invalid_auth",
           "account_inactive",
           "user_is_bot",
           "user_is_restricted",
           "user_is_ultra_restricted",
           "invalid_arg_name",
           "invalid_array_arg",
           "invalid_charset",
           "invalid_form_data",
           "invalid_post_type",
           "missing_post_type",
           "invalid_json",
           "json_not_object",
           "request_timeout",
           "upgrade_required",
           "team_added_to_org",
           "missing_charset",
           "superfluous_charset"
         ]},
      needed: {:string, :generic},
      ok: {:const, false},
      provided: {:string, :generic}
    ]
  end
end
