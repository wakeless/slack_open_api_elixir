defmodule SlackOpenApi.Web.Team.Profile do
  @moduledoc """
  Provides API endpoint related to team/profile
  """

  @default_client SlackOpenApi.Client

  @type get_200_json_resp :: %{
          ok: true,
          profile: SlackOpenApi.Web.Team.ProfileProfile.get_200_json_resp()
        }

  @type get_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

  @doc """
  get `/team.profile.get`

  Retrieve a team's profile.

  ## Options

    * `token`: Authentication token. Requires scope: `users.profile:read`
    * `visibility`: Filter by visibility.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/team.profile.get)

  """
  @spec get(keyword) :: {:ok, map} | {:error, map}
  def get(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:token, :visibility])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Team.Profile, :get},
      url: "/team.profile.get",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Team.Profile, :get_200_json_resp}},
        default: {SlackOpenApi.Web.Team.Profile, :get_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:get_200_json_resp) do
    [ok: {:const, true}, profile: {SlackOpenApi.Web.Team.ProfileProfile, :get_200_json_resp}]
  end

  def __fields__(:get_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "not_authed",
           "invalid_auth",
           "account_inactive",
           "no_permission",
           "user_is_bot",
           "invalid_arg_name",
           "invalid_array_arg",
           "invalid_charset",
           "invalid_form_data",
           "invalid_post_typ",
           "missing_post_type",
           "team_added_to_org",
           "invalid_json",
           "json_not_object",
           "request_timeou",
           "upgrade_required"
         ]},
      ok: {:const, false}
    ]
  end
end
