defmodule SlackOpenApi.Web.Chat do
  @moduledoc """
  Provides API endpoints related to chat
  """

  @default_client SlackOpenApi.Client

  @type chat_delete_200_json_resp :: %{channel: String.t(), ok: true, ts: String.t()}

  @type chat_delete_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  post `/chat.delete`

  Deletes a message.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/chat.delete)

  """
  @spec chat_delete(map, keyword) :: {:ok, map} | {:error, map}
  def chat_delete(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Chat, :chat_delete},
      url: "/chat.delete",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Chat, :chat_delete_200_json_resp}},
        default: {SlackOpenApi.Web.Chat, :chat_delete_default_json_resp}
      ],
      opts: opts
    })
  end

  @type chat_delete_scheduled_message_200_json_resp :: %{ok: true}

  @type chat_delete_scheduled_message_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  post `/chat.deleteScheduledMessage`

  Deletes a pending scheduled message from the queue.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/chat.deleteScheduledMessage)

  """
  @spec chat_delete_scheduled_message(map, keyword) :: {:ok, map} | {:error, map}
  def chat_delete_scheduled_message(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Chat, :chat_delete_scheduled_message},
      url: "/chat.deleteScheduledMessage",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Chat, :chat_delete_scheduled_message_200_json_resp}},
        default: {SlackOpenApi.Web.Chat, :chat_delete_scheduled_message_default_json_resp}
      ],
      opts: opts
    })
  end

  @type chat_get_permalink_200_json_resp :: %{
          channel: String.t(),
          ok: true,
          permalink: String.t()
        }

  @type chat_get_permalink_default_json_resp :: %{
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
  @spec chat_get_permalink(keyword) :: {:ok, map} | {:error, map}
  def chat_get_permalink(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:channel, :message_ts, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Chat, :chat_get_permalink},
      url: "/chat.getPermalink",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Chat, :chat_get_permalink_200_json_resp}},
        default: {SlackOpenApi.Web.Chat, :chat_get_permalink_default_json_resp}
      ],
      opts: opts
    })
  end

  @type chat_me_message_200_json_resp :: %{
          channel: String.t() | nil,
          ok: true,
          ts: String.t() | nil
        }

  @type chat_me_message_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  post `/chat.meMessage`

  Share a me message into a channel.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/chat.meMessage)

  """
  @spec chat_me_message(map, keyword) :: {:ok, map} | {:error, map}
  def chat_me_message(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Chat, :chat_me_message},
      url: "/chat.meMessage",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Chat, :chat_me_message_200_json_resp}},
        default: {SlackOpenApi.Web.Chat, :chat_me_message_default_json_resp}
      ],
      opts: opts
    })
  end

  @type chat_post_ephemeral_200_json_resp :: %{message_ts: String.t(), ok: true}

  @type chat_post_ephemeral_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  post `/chat.postEphemeral`

  Sends an ephemeral message to a user in a channel.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/chat.postEphemeral)

  """
  @spec chat_post_ephemeral(map, keyword) :: {:ok, map} | {:error, map}
  def chat_post_ephemeral(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Chat, :chat_post_ephemeral},
      url: "/chat.postEphemeral",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Chat, :chat_post_ephemeral_200_json_resp}},
        default: {SlackOpenApi.Web.Chat, :chat_post_ephemeral_default_json_resp}
      ],
      opts: opts
    })
  end

  @type chat_post_message_200_json_resp :: %{
          channel: String.t(),
          message: SlackOpenApi.Web.ObjsMessage.t(),
          ok: true,
          ts: String.t()
        }

  @type chat_post_message_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  post `/chat.postMessage`

  Sends a message to a channel.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/chat.postMessage)

  """
  @spec chat_post_message(map, keyword) :: {:ok, map} | {:error, map}
  def chat_post_message(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Chat, :chat_post_message},
      url: "/chat.postMessage",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Chat, :chat_post_message_200_json_resp}},
        default: {SlackOpenApi.Web.Chat, :chat_post_message_default_json_resp}
      ],
      opts: opts
    })
  end

  @type chat_schedule_message_200_json_resp :: %{
          channel: String.t(),
          message: SlackOpenApi.Web.ChatMessage.chat_schedule_message_200_json_resp(),
          ok: true,
          post_at: integer,
          scheduled_message_id: String.t()
        }

  @type chat_schedule_message_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  post `/chat.scheduleMessage`

  Schedules a message to be sent to a channel.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/chat.scheduleMessage)

  """
  @spec chat_schedule_message(map, keyword) :: {:ok, map} | {:error, map}
  def chat_schedule_message(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Chat, :chat_schedule_message},
      url: "/chat.scheduleMessage",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Chat, :chat_schedule_message_200_json_resp}},
        default: {SlackOpenApi.Web.Chat, :chat_schedule_message_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc """
  get `/chat.scheduledMessages.list`

  Returns a list of scheduled messages.

  ## Options

    * `channel`: The channel of the scheduled messages
    * `latest`: A UNIX timestamp of the latest value in the time range
    * `oldest`: A UNIX timestamp of the oldest value in the time range
    * `limit`: Maximum number of original entries to return.
    * `cursor`: For pagination purposes, this is the `cursor` value returned from a previous call to `chat.scheduledmessages.list` indicating where you want to start this call from.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/chat.scheduledMessages.list)

  """
  @spec chat_scheduled_messages_list(keyword) ::
          {:ok, SlackOpenApi.Web.ChatScheduledMessagesListSchema.t()}
          | {:error, SlackOpenApi.Web.ChatScheduledMessagesListErrorSchema.t()}
  def chat_scheduled_messages_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:channel, :cursor, :latest, :limit, :oldest])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Chat, :chat_scheduled_messages_list},
      url: "/chat.scheduledMessages.list",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.ChatScheduledMessagesListSchema, :t}},
        default: {SlackOpenApi.Web.ChatScheduledMessagesListErrorSchema, :t}
      ],
      opts: opts
    })
  end

  @type chat_unfurl_200_json_resp :: %{ok: true}

  @type chat_unfurl_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  post `/chat.unfurl`

  Provide custom unfurl behavior for user-posted URLs

  ## Resources

    * [API method documentation](https://api.slack.com/methods/chat.unfurl)

  """
  @spec chat_unfurl(map, keyword) :: {:ok, map} | {:error, map}
  def chat_unfurl(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Chat, :chat_unfurl},
      url: "/chat.unfurl",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Chat, :chat_unfurl_200_json_resp}},
        default: {SlackOpenApi.Web.Chat, :chat_unfurl_default_json_resp}
      ],
      opts: opts
    })
  end

  @type chat_update_200_json_resp :: %{
          channel: String.t(),
          message: SlackOpenApi.Web.MessageObject.t(),
          ok: true,
          text: String.t(),
          ts: String.t()
        }

  @type chat_update_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  post `/chat.update`

  Updates a message.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/chat.update)

  """
  @spec chat_update(map, keyword) :: {:ok, map} | {:error, map}
  def chat_update(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Chat, :chat_update},
      url: "/chat.update",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Chat, :chat_update_200_json_resp}},
        default: {SlackOpenApi.Web.Chat, :chat_update_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:chat_delete_200_json_resp) do
    [channel: {:string, :generic}, ok: {:const, true}, ts: {:string, :generic}]
  end

  def __fields__(:chat_delete_default_json_resp) do
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

  def __fields__(:chat_delete_scheduled_message_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:chat_delete_scheduled_message_default_json_resp) do
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

  def __fields__(:chat_get_permalink_200_json_resp) do
    [channel: {:string, :generic}, ok: {:const, true}, permalink: {:string, :uri}]
  end

  def __fields__(:chat_get_permalink_default_json_resp) do
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

  def __fields__(:chat_me_message_200_json_resp) do
    [channel: {:string, :generic}, ok: {:const, true}, ts: {:string, :generic}]
  end

  def __fields__(:chat_me_message_default_json_resp) do
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

  def __fields__(:chat_post_ephemeral_200_json_resp) do
    [message_ts: {:string, :generic}, ok: {:const, true}]
  end

  def __fields__(:chat_post_ephemeral_default_json_resp) do
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

  def __fields__(:chat_post_message_200_json_resp) do
    [
      channel: {:string, :generic},
      message: {SlackOpenApi.Web.ObjsMessage, :t},
      ok: {:const, true},
      ts: {:string, :generic}
    ]
  end

  def __fields__(:chat_post_message_default_json_resp) do
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

  def __fields__(:chat_schedule_message_200_json_resp) do
    [
      channel: {:string, :generic},
      message: {SlackOpenApi.Web.ChatMessage, :chat_schedule_message_200_json_resp},
      ok: {:const, true},
      post_at: :integer,
      scheduled_message_id: {:string, :generic}
    ]
  end

  def __fields__(:chat_schedule_message_default_json_resp) do
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

  def __fields__(:chat_unfurl_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:chat_unfurl_default_json_resp) do
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

  def __fields__(:chat_update_200_json_resp) do
    [
      channel: {:string, :generic},
      message: {SlackOpenApi.Web.MessageObject, :t},
      ok: {:const, true},
      text: {:string, :generic},
      ts: {:string, :generic}
    ]
  end

  def __fields__(:chat_update_default_json_resp) do
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
