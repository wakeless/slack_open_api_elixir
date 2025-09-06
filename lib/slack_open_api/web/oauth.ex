defmodule SlackOpenApi.Web.Oauth do
  @moduledoc """
  Provides API endpoints related to oauth
  """

  @default_client SlackOpenApi.Client

  @type oauth_access_200_json_resp :: %{ok: true}

  @type oauth_access_default_json_resp :: %{ok: false}

  @doc """
  get `/oauth.access`

  Exchanges a temporary OAuth verifier code for an access token.

  ## Options

    * `client_id`: Issued when you created your application.
    * `client_secret`: Issued when you created your application.
    * `code`: The `code` param returned via the OAuth callback.
    * `redirect_uri`: This must match the originally submitted URI (if one was sent).
    * `single_channel`: Request the user to add your app only to a single channel. Only valid with a [legacy workspace app](https://api.slack.com/legacy-workspace-apps).

  ## Resources

    * [API method documentation](https://api.slack.com/methods/oauth.access)

  """
  @spec oauth_access(keyword) :: {:ok, map} | {:error, map}
  def oauth_access(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:client_id, :client_secret, :code, :redirect_uri, :single_channel])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Oauth, :oauth_access},
      url: "/oauth.access",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Oauth, :oauth_access_200_json_resp}},
        default: {SlackOpenApi.Web.Oauth, :oauth_access_default_json_resp}
      ],
      opts: opts
    })
  end

  @type oauth_token_200_json_resp :: %{ok: true}

  @type oauth_token_default_json_resp :: %{ok: false}

  @doc """
  get `/oauth.token`

  Exchanges a temporary OAuth verifier code for a workspace token.

  ## Options

    * `client_id`: Issued when you created your application.
    * `client_secret`: Issued when you created your application.
    * `code`: The `code` param returned via the OAuth callback.
    * `redirect_uri`: This must match the originally submitted URI (if one was sent).
    * `single_channel`: Request the user to add your app only to a single channel.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/oauth.token)

  """
  @spec oauth_token(keyword) :: {:ok, map} | {:error, map}
  def oauth_token(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:client_id, :client_secret, :code, :redirect_uri, :single_channel])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Oauth, :oauth_token},
      url: "/oauth.token",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Oauth, :oauth_token_200_json_resp}},
        default: {SlackOpenApi.Web.Oauth, :oauth_token_default_json_resp}
      ],
      opts: opts
    })
  end

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
      call: {SlackOpenApi.Web.Oauth, :oauth_v2_access},
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

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:oauth_access_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:oauth_access_default_json_resp) do
    [ok: {:const, false}]
  end

  def __fields__(:oauth_token_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:oauth_token_default_json_resp) do
    [ok: {:const, false}]
  end
end
