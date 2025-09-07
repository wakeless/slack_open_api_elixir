defmodule SlackOpenApi.Web.Admin.Teams.Admins do
  @moduledoc """
  Provides API endpoint related to admin/teams/admins
  """

  @default_client SlackOpenApi.Client

  @type list_200_json_resp :: %{ok: true}

  @type list_default_json_resp :: %{ok: false}

  @doc """
  get `/admin.teams.admins.list`

  List all of the admins on a given workspace.

  ## Options

    * `token`: Authentication token. Requires scope: `admin.teams:read`
    * `limit`: The maximum number of items to return.
    * `cursor`: Set `cursor` to `next_cursor` returned by the previous call to list items in the next page.
    * `team_id`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.teams.admins.list)

  """
  @spec list(opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Admin.Teams.Admins.list_200_json_resp()}
          | {:error, SlackOpenApi.Web.Admin.Teams.Admins.list_default_json_resp()}
  def list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:cursor, :limit, :team_id, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Admin.Teams.Admins, :list},
      url: "/admin.teams.admins.list",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Admin.Teams.Admins, :list_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.Teams.Admins, :list_default_json_resp}
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
