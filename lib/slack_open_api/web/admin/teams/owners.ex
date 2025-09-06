defmodule SlackOpenApi.Web.Admin.Teams.Owners do
  @moduledoc """
  Provides API endpoint related to admin/teams/owners
  """

  @default_client SlackOpenApi.Client

  @type list_200_json_resp :: %{ok: true}

  @type list_default_json_resp :: %{ok: false}

  @doc """
  get `/admin.teams.owners.list`

  List all of the owners on a given workspace.

  ## Options

    * `token`: Authentication token. Requires scope: `admin.teams:read`
    * `team_id`
    * `limit`: The maximum number of items to return. Must be between 1 - 1000 both inclusive.
    * `cursor`: Set `cursor` to `next_cursor` returned by the previous call to list items in the next page.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.teams.owners.list)

  """
  @spec list(keyword) :: {:ok, map} | {:error, map}
  def list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:cursor, :limit, :team_id, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Admin.Teams.Owners, :list},
      url: "/admin.teams.owners.list",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Admin.Teams.Owners, :list_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.Teams.Owners, :list_default_json_resp}
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
