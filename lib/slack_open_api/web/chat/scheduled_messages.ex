defmodule SlackOpenApi.Web.Chat.ScheduledMessages do
  @moduledoc """
  Provides API endpoint related to chat/scheduled messages
  """

  @default_client SlackOpenApi.Client

  @type list_200_json_resp :: %{
          ok: true,
          response_metadata:
            SlackOpenApi.Web.Chat.ScheduledMessages.list_200_json_resp_response_metadata(),
          scheduled_messages: [
            SlackOpenApi.Web.Chat.ScheduledMessages.list_200_json_resp_scheduled_messages()
          ]
        }

  @type list_200_json_resp_response_metadata :: %{next_cursor: String.t()}

  @type list_200_json_resp_scheduled_messages :: %{
          channel_id: String.t(),
          date_created: integer,
          id: String.t(),
          post_at: integer,
          text: String.t() | nil
        }

  @type list_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

  @doc """
  post `/chat.scheduledMessages.list`

  Returns a list of scheduled messages.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`
    * **Description**: Request body with the following parameters:
      * `channel`: The channel of the scheduled messages
      * `latest`: A UNIX timestamp of the latest value in the time range
      * `oldest`: A UNIX timestamp of the oldest value in the time range
      * `limit`: Maximum number of original entries to return.
      * `cursor`: For pagination purposes, this is the `cursor` value returned from a previous call to `chat.scheduledmessages.list` indicating where you want to start this call from.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/chat.scheduledMessages.list)

  """
  @spec list(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Chat.ScheduledMessages.list_200_json_resp()}
          | {:error, SlackOpenApi.Web.Chat.ScheduledMessages.list_default_json_resp()}
  def list(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Chat.ScheduledMessages, :list},
      url: "/chat.scheduledMessages.list",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Chat.ScheduledMessages, :list_200_json_resp}},
        default: {SlackOpenApi.Web.Chat.ScheduledMessages, :list_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:list_200_json_resp) do
    [
      ok: {:const, true},
      response_metadata:
        {SlackOpenApi.Web.Chat.ScheduledMessages, :list_200_json_resp_response_metadata},
      scheduled_messages: [
        {SlackOpenApi.Web.Chat.ScheduledMessages, :list_200_json_resp_scheduled_messages}
      ]
    ]
  end

  def __fields__(:list_200_json_resp_response_metadata) do
    [next_cursor: {:string, :generic}]
  end

  def __fields__(:list_200_json_resp_scheduled_messages) do
    [
      channel_id: {:string, :generic},
      date_created: :integer,
      id: {:string, :generic},
      post_at: :integer,
      text: {:string, :generic}
    ]
  end

  def __fields__(:list_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "invalid_channel",
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
end
