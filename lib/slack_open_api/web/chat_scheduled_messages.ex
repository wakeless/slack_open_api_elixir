defmodule SlackOpenApi.Web.ChatScheduledMessages do
  @moduledoc """
  Provides API endpoint related to chat scheduled messages
  """

  @default_client SlackOpenApi.Client

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
      call: {SlackOpenApi.Web.ChatScheduledMessages, :chat_scheduled_messages_list},
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
end
