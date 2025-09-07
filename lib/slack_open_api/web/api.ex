defmodule SlackOpenApi.Web.Api do
  @moduledoc """
  Provides API endpoint related to api
  """

  @default_client SlackOpenApi.Client

  @type test_200_json_resp :: %{ok: true}

  @type test_default_json_resp :: %{error: String.t(), ok: false}

  @doc """
  post `/api.test`

  Checks API calling code.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`
    * **Description**: Request body with the following parameters:
      * `error`: Error response to return
      * `foo`: example property to return

  ## Resources

    * [API method documentation](https://api.slack.com/methods/api.test)

  """
  @spec test(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Api.test_200_json_resp()}
          | {:error, SlackOpenApi.Web.Api.test_default_json_resp()}
  def test body, opts \\ [] do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Api, :test},
      url: "/api.test",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Api, :test_200_json_resp}},
        default: {SlackOpenApi.Web.Api, :test_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:test_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:test_default_json_resp) do
    [error: {:string, :generic}, ok: {:const, false}]
  end
end
