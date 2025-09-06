defmodule SlackOpenApi.Web.AdminConversationsEkm do
  @moduledoc """
  Provides API endpoint related to admin conversations ekm
  """

  @default_client SlackOpenApi.Client

  @doc """
  get `/admin.conversations.ekm.listOriginalConnectedChannelInfo`

  List all disconnected channels—i.e., channels that were once connected to other workspaces and then disconnected—and the corresponding original channel IDs for key revocation with EKM.

  ## Options

    * `token`: Authentication token. Requires scope: `admin.conversations:read`
    * `channel_ids`: A comma-separated list of channels to filter to.
    * `team_ids`: A comma-separated list of the workspaces to which the channels you would like returned belong.
    * `limit`: The maximum number of items to return. Must be between 1 - 1000 both inclusive.
    * `cursor`: Set `cursor` to `next_cursor` returned by the previous call to list items in the next page.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.conversations.ekm.listOriginalConnectedChannelInfo)

  """
  @spec admin_conversations_ekm_list_original_connected_channel_info(keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_conversations_ekm_list_original_connected_channel_info(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:channel_ids, :cursor, :limit, :team_ids, :token])

    client.request(%{
      args: [],
      call:
        {SlackOpenApi.Web.AdminConversationsEkm,
         :admin_conversations_ekm_list_original_connected_channel_info},
      url: "/admin.conversations.ekm.listOriginalConnectedChannelInfo",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.DefaultSuccessTemplate, :t}},
        default: {SlackOpenApi.Web.DefaultErrorTemplate, :t}
      ],
      opts: opts
    })
  end
end
