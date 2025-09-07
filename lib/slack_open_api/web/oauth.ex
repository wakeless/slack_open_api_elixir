defmodule SlackOpenApi.Web.Oauth do
  @moduledoc """
  Provides API endpoints related to oauth
  """

  @default_client SlackOpenApi.Client

  @type access_200_json_resp :: %{ok: true}

  @type access_default_json_resp :: %{ok: false}

  @doc """
  post `/oauth.access`

  Exchanges a temporary OAuth verifier code for an access token.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`
    * **Description**: Request body with the following parameters:
      * `client_id`: Issued when you created your application.
      * `client_secret`: Issued when you created your application.
      * `code`: The `code` param returned via the OAuth callback.
      * `redirect_uri`: This must match the originally submitted URI (if one was sent).
      * `single_channel`: Request the user to add your app only to a single channel. Only valid with a [legacy workspace app](https://api.slack.com/legacy-workspace-apps).

  ## Resources

    * [API method documentation](https://api.slack.com/methods/oauth.access)

  """
  @spec access(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Oauth.access_200_json_resp()}
          | {:error, SlackOpenApi.Web.Oauth.access_default_json_resp()}
  def access(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Oauth, :access},
      url: "/oauth.access",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Oauth, :access_200_json_resp}},
        default: {SlackOpenApi.Web.Oauth, :access_default_json_resp}
      ],
      opts: opts
    })
  end

  @type token_200_json_resp :: %{ok: true}

  @type token_default_json_resp :: %{ok: false}

  @doc """
  post `/oauth.token`

  Exchanges a temporary OAuth verifier code for a workspace token.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`
    * **Description**: Request body with the following parameters:
      * `client_id`: Issued when you created your application.
      * `client_secret`: Issued when you created your application.
      * `code`: The `code` param returned via the OAuth callback.
      * `redirect_uri`: This must match the originally submitted URI (if one was sent).
      * `single_channel`: Request the user to add your app only to a single channel.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/oauth.token)

  """
  @spec token(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Oauth.token_200_json_resp()}
          | {:error, SlackOpenApi.Web.Oauth.token_default_json_resp()}
  def token(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Oauth, :token},
      url: "/oauth.token",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Oauth, :token_200_json_resp}},
        default: {SlackOpenApi.Web.Oauth, :token_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:access_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:access_default_json_resp) do
    [ok: {:const, false}]
  end

  def __fields__(:token_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:token_default_json_resp) do
    [ok: {:const, false}]
  end
end
