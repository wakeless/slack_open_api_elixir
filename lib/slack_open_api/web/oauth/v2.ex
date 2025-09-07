defmodule SlackOpenApi.Web.Oauth.V2 do
  @moduledoc """
  Provides API endpoint related to oauth/v2
  """

  @default_client SlackOpenApi.Client

  @type access_200_json_resp :: %{ok: true}

  @type access_default_json_resp :: %{ok: false}

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
  @spec access(keyword) :: {:ok, map} | {:error, map}
  def access(opts \\ []) do
    client = opts[:client] || @default_client

    # Extract client credentials for basic auth
    client_id = opts[:client_id] || SlackOpenApi.Config.client_id(opts)
    client_secret = opts[:client_secret] || SlackOpenApi.Config.client_secret(opts)

"AACCC" |> dbg
    # Only include non-auth parameters in query
    query = Keyword.take(opts, [:code, :redirect_uri]) |> dbg

    # Pass auth credentials if provided
    auth = if client_id && client_secret do
      # Use the new Req auth format: {:basic, "username:password"}
      {:basic, "#{client_id}:#{client_secret}"}
    else
      nil
    end

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Oauth.V2, :access},
      url: "/oauth.v2.access",
      method: :post,
      body: query,
      auth: auth,
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
