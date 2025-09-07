defmodule SlackOpenApi.Web.Chat do
  @moduledoc """
  Provides API endpoints related to chat
  """

  @default_client SlackOpenApi.Client

  @type delete_200_json_resp :: %{channel: String.t(), ok: true, ts: String.t()}

  @type delete_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

  @doc """
  post `/chat.delete`

  Deletes a message.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/chat.delete)

  """
  @spec delete(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Chat.delete_200_json_resp()}
          | {:error, SlackOpenApi.Web.Chat.delete_default_json_resp()}
  def delete(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Chat, :delete},
      url: "/chat.delete",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Chat, :delete_200_json_resp}},
        default: {SlackOpenApi.Web.Chat, :delete_default_json_resp}
      ],
      opts: opts
    })
  end

  @type delete_scheduled_message_200_json_resp :: %{ok: true}

  @type delete_scheduled_message_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  post `/chat.deleteScheduledMessage`

  Deletes a pending scheduled message from the queue.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/chat.deleteScheduledMessage)

  """
  @spec delete_scheduled_message(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Chat.delete_scheduled_message_200_json_resp()}
          | {:error, SlackOpenApi.Web.Chat.delete_scheduled_message_default_json_resp()}
  def delete_scheduled_message(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Chat, :delete_scheduled_message},
      url: "/chat.deleteScheduledMessage",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Chat, :delete_scheduled_message_200_json_resp}},
        default: {SlackOpenApi.Web.Chat, :delete_scheduled_message_default_json_resp}
      ],
      opts: opts
    })
  end

  @type get_permalink_200_json_resp :: %{channel: String.t(), ok: true, permalink: String.t()}

  @type get_permalink_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  get `/chat.getPermalink`

  Retrieve a permalink URL for a specific extant message

  ## Options

    * `token`: Authentication token. Requires scope: `none`
    * `channel`: The ID of the conversation or channel containing the message
    * `message_ts`: A message's `ts` value, uniquely identifying it within a channel

  ## Resources

    * [API method documentation](https://api.slack.com/methods/chat.getPermalink)

  """
  @spec get_permalink(opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Chat.get_permalink_200_json_resp()}
          | {:error, SlackOpenApi.Web.Chat.get_permalink_default_json_resp()}
  def get_permalink(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:channel, :message_ts, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Chat, :get_permalink},
      url: "/chat.getPermalink",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Chat, :get_permalink_200_json_resp}},
        default: {SlackOpenApi.Web.Chat, :get_permalink_default_json_resp}
      ],
      opts: opts
    })
  end

  @type me_message_200_json_resp :: %{channel: String.t() | nil, ok: true, ts: String.t() | nil}

  @type me_message_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  post `/chat.meMessage`

  Share a me message into a channel.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/chat.meMessage)

  """
  @spec me_message(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Chat.me_message_200_json_resp()}
          | {:error, SlackOpenApi.Web.Chat.me_message_default_json_resp()}
  def me_message(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Chat, :me_message},
      url: "/chat.meMessage",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Chat, :me_message_200_json_resp}},
        default: {SlackOpenApi.Web.Chat, :me_message_default_json_resp}
      ],
      opts: opts
    })
  end

  @type post_ephemeral_200_json_resp :: %{message_ts: String.t(), ok: true}

  @type post_ephemeral_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  post `/chat.postEphemeral`

  Sends an ephemeral message to a user in a channel.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/chat.postEphemeral)

  """
  @spec post_ephemeral(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Chat.post_ephemeral_200_json_resp()}
          | {:error, SlackOpenApi.Web.Chat.post_ephemeral_default_json_resp()}
  def post_ephemeral(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Chat, :post_ephemeral},
      url: "/chat.postEphemeral",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Chat, :post_ephemeral_200_json_resp}},
        default: {SlackOpenApi.Web.Chat, :post_ephemeral_default_json_resp}
      ],
      opts: opts
    })
  end

  @type post_message_200_json_resp :: %{
          channel: String.t(),
          message: SlackOpenApi.Web.ObjsMessage.t(),
          ok: true,
          ts: String.t()
        }

  @type post_message_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  post `/chat.postMessage`

  Sends a message to a channel.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/chat.postMessage)

  """
  @spec post_message(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Chat.post_message_200_json_resp()}
          | {:error, SlackOpenApi.Web.Chat.post_message_default_json_resp()}
  def post_message(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Chat, :post_message},
      url: "/chat.postMessage",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Chat, :post_message_200_json_resp}},
        default: {SlackOpenApi.Web.Chat, :post_message_default_json_resp}
      ],
      opts: opts
    })
  end

  @type schedule_message_200_json_resp :: %{
          channel: String.t(),
          message: SlackOpenApi.Web.Chat.schedule_message_200_json_resp_message(),
          ok: true,
          post_at: integer,
          scheduled_message_id: String.t()
        }

  @type schedule_message_200_json_resp_message :: %{
          bot_id: String.t(),
          bot_profile: SlackOpenApi.Web.ObjsBotProfile.t() | nil,
          team: String.t(),
          text: String.t(),
          type: String.t(),
          user: String.t(),
          username: String.t() | nil
        }

  @type schedule_message_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  post `/chat.scheduleMessage`

  Schedules a message to be sent to a channel.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/chat.scheduleMessage)

  """
  @spec schedule_message(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Chat.schedule_message_200_json_resp()}
          | {:error, SlackOpenApi.Web.Chat.schedule_message_default_json_resp()}
  def schedule_message(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Chat, :schedule_message},
      url: "/chat.scheduleMessage",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Chat, :schedule_message_200_json_resp}},
        default: {SlackOpenApi.Web.Chat, :schedule_message_default_json_resp}
      ],
      opts: opts
    })
  end

  @type unfurl_200_json_resp :: %{ok: true}

  @type unfurl_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

  @doc """
  post `/chat.unfurl`

  Provide custom unfurl behavior for user-posted URLs

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/chat.unfurl)

  """
  @spec unfurl(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Chat.unfurl_200_json_resp()}
          | {:error, SlackOpenApi.Web.Chat.unfurl_default_json_resp()}
  def unfurl(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Chat, :unfurl},
      url: "/chat.unfurl",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Chat, :unfurl_200_json_resp}},
        default: {SlackOpenApi.Web.Chat, :unfurl_default_json_resp}
      ],
      opts: opts
    })
  end

  @type update_200_json_resp :: %{
          channel: String.t(),
          message: SlackOpenApi.Web.MessageObject.t(),
          ok: true,
          text: String.t(),
          ts: String.t()
        }

  @type update_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

  @doc """
  post `/chat.update`

  Updates a message.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/chat.update)

  """
  @spec update(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Chat.update_200_json_resp()}
          | {:error, SlackOpenApi.Web.Chat.update_default_json_resp()}
  def update(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Chat, :update},
      url: "/chat.update",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Chat, :update_200_json_resp}},
        default: {SlackOpenApi.Web.Chat, :update_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:delete_200_json_resp) do
    [channel: {:string, :generic}, ok: {:const, true}, ts: {:string, :generic}]
  end

  def __fields__(:delete_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "message_not_found",
           "channel_not_found",
           "cant_delete_message",
           "not_authed",
           "invalid_auth",
           "account_inactive",
           "token_revoked",
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

  def __fields__(:delete_scheduled_message_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:delete_scheduled_message_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "invalid_scheduled_message_id",
           "channel_not_found",
           "bad_token",
           "not_authed",
           "invalid_auth",
           "account_inactive",
           "token_revoked",
           "no_permission",
           "org_login_required",
           "ekm_access_denied",
           "missing_scope",
           "invalid_arguments",
           "invalid_arg_name",
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

  def __fields__(:get_permalink_200_json_resp) do
    [channel: {:string, :generic}, ok: {:const, true}, permalink: {:string, :uri}]
  end

  def __fields__(:get_permalink_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "channel_not_found",
           "message_not_found",
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

  def __fields__(:me_message_200_json_resp) do
    [channel: {:string, :generic}, ok: {:const, true}, ts: {:string, :generic}]
  end

  def __fields__(:me_message_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "channel_not_found",
           "not_in_channel",
           "is_archived",
           "msg_too_long",
           "no_text",
           "rate_limited",
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

  def __fields__(:post_ephemeral_200_json_resp) do
    [message_ts: {:string, :generic}, ok: {:const, true}]
  end

  def __fields__(:post_ephemeral_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "channel_not_found",
           "is_archived",
           "msg_too_long",
           "no_text",
           "restricted_action",
           "too_many_attachments",
           "user_not_in_channel",
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

  def __fields__(:post_message_200_json_resp) do
    [
      channel: {:string, :generic},
      message: {SlackOpenApi.Web.ObjsMessage, :t},
      ok: {:const, true},
      ts: {:string, :generic}
    ]
  end

  def __fields__(:post_message_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "channel_not_found",
           "not_in_channel",
           "is_archived",
           "msg_too_long",
           "no_text",
           "too_many_attachments",
           "rate_limited",
           "not_authed",
           "invalid_auth",
           "account_inactive",
           "invalid_arg_name",
           "invalid_array_arg",
           "invalid_charset",
           "invalid_form_data",
           "invalid_post_type",
           "missing_post_type"
         ]},
      ok: {:const, false}
    ]
  end

  def __fields__(:schedule_message_200_json_resp) do
    [
      channel: {:string, :generic},
      message: {SlackOpenApi.Web.Chat, :schedule_message_200_json_resp_message},
      ok: {:const, true},
      post_at: :integer,
      scheduled_message_id: {:string, :generic}
    ]
  end

  def __fields__(:schedule_message_200_json_resp_message) do
    [
      bot_id: {:string, :generic},
      bot_profile: {SlackOpenApi.Web.ObjsBotProfile, :t},
      team: {:string, :generic},
      text: {:string, :generic},
      type: {:string, :generic},
      user: {:string, :generic},
      username: {:string, :generic}
    ]
  end

  def __fields__(:schedule_message_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "invalid_time",
           "time_in_past",
           "time_too_far",
           "channel_not_found",
           "not_in_channel",
           "is_archived",
           "msg_too_long",
           "no_text",
           "restricted_action",
           "restricted_action_read_only_channel",
           "restricted_action_thread_only_channel",
           "restricted_action_non_threadable_channel",
           "too_many_attachments",
           "rate_limited",
           "not_authed",
           "invalid_auth",
           "account_inactive",
           "token_revoked",
           "no_permission",
           "org_login_required",
           "ekm_access_denied",
           "missing_scope",
           "invalid_arguments",
           "invalid_arg_name",
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

  def __fields__(:unfurl_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:unfurl_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "cannot_unfurl_url",
           "cannot_find_service",
           "missing_unfurls",
           "cannot_prompt",
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

  def __fields__(:update_200_json_resp) do
    [
      channel: {:string, :generic},
      message: {SlackOpenApi.Web.MessageObject, :t},
      ok: {:const, true},
      text: {:string, :generic},
      ts: {:string, :generic}
    ]
  end

  def __fields__(:update_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "message_not_found",
           "cant_update_message",
           "channel_not_found",
           "edit_window_closed",
           "msg_too_long",
           "too_many_attachments",
           "rate_limited",
           "no_text",
           "not_authed",
           "invalid_auth",
           "account_inactive",
           "token_revoked",
           "no_permission",
           "invalid_arg_name",
           "invalid_array_arg",
           "invalid_charset",
           "invalid_form_data",
           "invalid_post_type",
           "missing_post_type",
           "request_timeout",
           "invalid_json",
           "json_not_object",
           "upgrade_required",
           "fatal_error",
           "is_inactive"
         ]},
      ok: {:const, false}
    ]
  end
end
