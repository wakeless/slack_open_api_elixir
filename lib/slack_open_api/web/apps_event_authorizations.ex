defmodule SlackOpenApi.Web.AppsEventAuthorizations do
  @moduledoc """
  Provides API endpoint related to apps event authorizations
  """

  @default_client SlackOpenApi.Client

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
  @spec apps_event_authorizations_list(keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def apps_event_authorizations_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:cursor, :event_context, :limit])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.AppsEventAuthorizations, :apps_event_authorizations_list},
      url: "/apps.event.authorizations.list",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.DefaultSuccessTemplate, :t}},
        default: {SlackOpenApi.Web.DefaultErrorTemplate, :t}
      ],
      opts: opts
    })
  end
end
