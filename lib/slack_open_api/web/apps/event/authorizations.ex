defmodule SlackOpenApi.Web.Apps.Event.Authorizations do
  @moduledoc """
  Provides API endpoint related to apps/event/authorizations
  """

  @default_client SlackOpenApi.Client

  @type list_200_json_resp :: %{ok: true}

  @type list_default_json_resp :: %{ok: false}

  @doc """
  get `/apps.event.authorizations.list`

  Get a list of authorizations for the given event context. Each authorization represents an app installation that the event is visible to.

  ## Options

    * `event_context`
    * `cursor`
    * `limit`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/apps.event.authorizations.list)

  """
  @spec list(opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Apps.Event.Authorizations.list_200_json_resp()}
          | {:error, SlackOpenApi.Web.Apps.Event.Authorizations.list_default_json_resp()}
  def list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:cursor, :event_context, :limit])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Apps.Event.Authorizations, :list},
      url: "/apps.event.authorizations.list",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Apps.Event.Authorizations, :list_200_json_resp}},
        default: {SlackOpenApi.Web.Apps.Event.Authorizations, :list_default_json_resp}
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
