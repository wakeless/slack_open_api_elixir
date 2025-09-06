defmodule SlackOpenApi.Web.TeamProfile do
  @moduledoc """
  Provides API endpoint related to team profile
  """

  @default_client SlackOpenApi.Client

  @doc """
  get `/team.profile.get`

  Retrieve a team's profile.

  ## Options

    * `token`: Authentication token. Requires scope: `users.profile:read`
    * `visibility`: Filter by visibility.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/team.profile.get)

  """
  @spec team_profile_get(keyword) ::
          {:ok, SlackOpenApi.Web.TeamProfileGetSuccessSchema.t()}
          | {:error, SlackOpenApi.Web.TeamProfileGetErrorSchema.t()}
  def team_profile_get(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:token, :visibility])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.TeamProfile, :team_profile_get},
      url: "/team.profile.get",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.TeamProfileGetSuccessSchema, :t}},
        default: {SlackOpenApi.Web.TeamProfileGetErrorSchema, :t}
      ],
      opts: opts
    })
  end
end
