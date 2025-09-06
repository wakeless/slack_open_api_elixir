defmodule SlackOpenApi.Web.Admin.Apps.Requests do
  @moduledoc """
  Provides API endpoint related to admin/apps/requests
  """

  @default_client SlackOpenApi.Client

  @type list_200_json_resp :: %{ok: true}

  @type list_default_json_resp :: %{ok: false}

  @doc """
  get `/admin.apps.requests.list`

  List app requests for a team/workspace.

  ## Options

    * `token`: Authentication token. Requires scope: `admin.apps:read`
    * `limit`: The maximum number of items to return. Must be between 1 - 1000 both inclusive.
    * `cursor`: Set `cursor` to `next_cursor` returned by the previous call to list items in the next page
    * `team_id`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.apps.requests.list)

  """
  @spec list(keyword) :: {:ok, map} | {:error, map}
  def list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:cursor, :limit, :team_id, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Admin.Apps.Requests, :list},
      url: "/admin.apps.requests.list",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Admin.Apps.Requests, :list_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.Apps.Requests, :list_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:list_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:list_default_json_resp) do
    [ok: {:const, false}]
  end
end
