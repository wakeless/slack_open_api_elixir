defmodule SlackOpenApi.Web.Oauth.V2 do
  @moduledoc """
  Provides API endpoint related to oauth/v2
  """

  @default_client SlackOpenApi.Client

  @type access_200_json_resp :: %{ok: true}

  @type access_default_json_resp :: %{ok: false}

  @doc """
  post `/oauth.v2.access`

  Exchanges a temporary OAuth verifier code for an access token.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`
    * **Description**: OAuth access token request body with the following parameters:
      * `client_id`: Issued when you created your application.
      * `client_secret`: Issued when you created your application.
      * `code` (required): The `code` param returned via the OAuth callback.
      * `redirect_uri`: This must match the originally submitted URI (if one was sent).

  ## Resources

    * [API method documentation](https://api.slack.com/methods/oauth.v2.access)

  """
  @spec access(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Oauth.V2.access_200_json_resp()}
          | {:error, SlackOpenApi.Web.Oauth.V2.access_default_json_resp()}
  def access(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Oauth.V2, :access},
      url: "/oauth.v2.access",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Oauth.V2, :access_200_json_resp}},
        default: {SlackOpenApi.Web.Oauth.V2, :access_default_json_resp}
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
end
