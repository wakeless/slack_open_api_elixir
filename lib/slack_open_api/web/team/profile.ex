defmodule SlackOpenApi.Web.Team.Profile do
  @moduledoc """
  Provides API endpoint related to team/profile
  """

  @default_client SlackOpenApi.Client

  @type get_200_json_resp :: %{
          ok: true,
          profile: SlackOpenApi.Web.Team.Profile.get_200_json_resp_profile()
        }

  @type get_200_json_resp_profile :: %{fields: [SlackOpenApi.Web.ObjsTeamProfileField.t()]}

  @type get_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

  @doc """
  post `/team.profile.get`

  Retrieve a team's profile.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`
    * **Description**: Request body with the following parameters:
      * `token` (required): Authentication token. Requires scope: `users.profile:read`
      * `visibility`: Filter by visibility.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/team.profile.get)

  """
  @spec get(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Team.Profile.get_200_json_resp()}
          | {:error, SlackOpenApi.Web.Team.Profile.get_default_json_resp()}
  def get(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Team.Profile, :get},
      url: "/team.profile.get",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
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
    [ok: {:const, true}, profile: {SlackOpenApi.Web.Team.Profile, :get_200_json_resp_profile}]
  end

  def __fields__(:get_200_json_resp_profile) do
    [fields: [{SlackOpenApi.Web.ObjsTeamProfileField, :t}]]
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
