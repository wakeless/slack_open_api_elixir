defmodule SlackOpenApi.Web.Api do
  @moduledoc """
  Provides API endpoint related to api
  """

  @default_client SlackOpenApi.Client

  @type test_200_json_resp :: %{ok: true}

  @type test_default_json_resp :: %{error: String.t(), ok: false}

  @doc """
  get `/api.test`

  Checks API calling code.

  ## Options

    * `error`: Error response to return
    * `foo`: example property to return

  ## Resources

    * [API method documentation](https://api.slack.com/methods/api.test)

  """
  @spec test(opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Api.test_200_json_resp()}
          | {:error, SlackOpenApi.Web.Api.test_default_json_resp()}
  def test opts \\ [] do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:error, :foo])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Api, :test},
      url: "/api.test",
      method: :get,
      query: query,
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
