defmodule SlackOpenApi.Web.Bots do
  @moduledoc """
  Provides API endpoint related to bots
  """

  @default_client SlackOpenApi.Client

  @type bots_info_200_json_resp :: %{
          bot: SlackOpenApi.Web.BotsBot.bots_info_200_json_resp(),
          ok: true
        }

  @type bots_info_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  get `/bots.info`

  Gets information about a bot user.

  ## Options

    * `token`: Authentication token. Requires scope: `users:read`
    * `bot`: Bot user to get info on

  ## Resources

    * [API method documentation](https://api.slack.com/methods/bots.info)

  """
  @spec bots_info(keyword) :: {:ok, map} | {:error, map}
  def bots_info(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:bot, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Bots, :bots_info},
      url: "/bots.info",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Bots, :bots_info_200_json_resp}},
        default: {SlackOpenApi.Web.Bots, :bots_info_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:bots_info_200_json_resp) do
    [bot: {SlackOpenApi.Web.BotsBot, :bots_info_200_json_resp}, ok: {:const, true}]
  end

  def __fields__(:bots_info_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "bot_not_found",
           "not_authed",
           "invalid_auth",
           "account_inactive",
           "token_revoked",
           "no_permission",
           "org_login_required",
           "invalid_arg_name",
           "invalid_array_arg",
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
