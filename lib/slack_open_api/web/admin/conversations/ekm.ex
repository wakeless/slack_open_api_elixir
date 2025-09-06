defmodule SlackOpenApi.Web.Admin.Conversations.Ekm do
  @moduledoc """
  Provides API endpoint related to admin/conversations/ekm
  """

  @default_client SlackOpenApi.Client

  @type list_original_connected_channel_info_200_json_resp :: %{ok: true}

  @type list_original_connected_channel_info_default_json_resp :: %{ok: false}

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
  @spec list_original_connected_channel_info(keyword) :: {:ok, map} | {:error, map}
  def list_original_connected_channel_info(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:channel_ids, :cursor, :limit, :team_ids, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Admin.Conversations.Ekm, :list_original_connected_channel_info},
      url: "/admin.conversations.ekm.listOriginalConnectedChannelInfo",
      method: :get,
      query: query,
      response: [
        {200,
         {SlackOpenApi.Web.Admin.Conversations.Ekm,
          :list_original_connected_channel_info_200_json_resp}},
        default:
          {SlackOpenApi.Web.Admin.Conversations.Ekm,
           :list_original_connected_channel_info_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:list_original_connected_channel_info_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:list_original_connected_channel_info_default_json_resp) do
    [ok: {:const, false}]
  end
end
