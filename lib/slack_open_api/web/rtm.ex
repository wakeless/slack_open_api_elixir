defmodule SlackOpenApi.Web.Rtm do
  @moduledoc """
  Provides API endpoint related to rtm
  """

  @default_client SlackOpenApi.Client

  @type connect_200_json_resp :: %{
          ok: true,
          self: SlackOpenApi.Web.Rtm.connect_200_json_resp_self(),
          team: SlackOpenApi.Web.Rtm.connect_200_json_resp_team(),
          url: String.t()
        }

  @type connect_200_json_resp_self :: %{id: String.t(), name: String.t()}

  @type connect_200_json_resp_team :: %{domain: String.t(), id: String.t(), name: String.t()}

  @type connect_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

  @doc """
  get `/rtm.connect`

  Starts a Real Time Messaging session.

  ## Options

    * `token`: Authentication token. Requires scope: `rtm:stream`
    * `batch_presence_aware`: Batch presence deliveries via subscription. Enabling changes the shape of `presence_change` events. See [batch presence](/docs/presence-and-status#batching).
    * `presence_sub`: Only deliver presence events when requested by subscription. See [presence subscriptions](/docs/presence-and-status#subscriptions).

  ## Resources

    * [API method documentation](https://api.slack.com/methods/rtm.connect)

  """
  @spec connect(opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Rtm.connect_200_json_resp()}
          | {:error, SlackOpenApi.Web.Rtm.connect_default_json_resp()}
  def connect(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:batch_presence_aware, :presence_sub, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Rtm, :connect},
      url: "/rtm.connect",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Rtm, :connect_200_json_resp}},
        default: {SlackOpenApi.Web.Rtm, :connect_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:connect_200_json_resp) do
    [
      ok: {:const, true},
      self: {SlackOpenApi.Web.Rtm, :connect_200_json_resp_self},
      team: {SlackOpenApi.Web.Rtm, :connect_200_json_resp_team},
      url: {:string, :uri}
    ]
  end

  def __fields__(:connect_200_json_resp_self) do
    [id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:connect_200_json_resp_team) do
    [domain: {:string, :generic}, id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:connect_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "not_authed",
           "invalid_auth",
           "account_inactive",
           "token_revoked",
           "no_permission",
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
