defmodule SlackOpenApi.Web.OauthV2 do
  @moduledoc """
  Provides API endpoint related to oauth v2
  """

  @default_client SlackOpenApi.Client

  @doc """
  get `/oauth.v2.access`

  Exchanges a temporary OAuth verifier code for an access token.

  ## Options

    * `client_id`: Issued when you created your application.
    * `client_secret`: Issued when you created your application.
    * `code`: The `code` param returned via the OAuth callback.
    * `redirect_uri`: This must match the originally submitted URI (if one was sent).

  ## Resources

    * [API method documentation](https://api.slack.com/methods/oauth.v2.access)

  """
  @spec oauth_v2_access(keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def oauth_v2_access(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:client_id, :client_secret, :code, :redirect_uri])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.OauthV2, :oauth_v2_access},
      url: "/oauth.v2.access",
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
