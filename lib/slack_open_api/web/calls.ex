defmodule SlackOpenApi.Web.Calls do
  @moduledoc """
  Provides API endpoints related to calls
  """

  @default_client SlackOpenApi.Client

  @type add_200_json_resp :: %{ok: true}

  @type add_default_json_resp :: %{ok: false}

  @doc """
  post `/calls.add`

  Registers a new Call.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/calls.add)

  """
  @spec add(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Calls.add_200_json_resp()}
          | {:error, SlackOpenApi.Web.Calls.add_default_json_resp()}
  def add(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Calls, :add},
      url: "/calls.add",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Calls, :add_200_json_resp}},
        default: {SlackOpenApi.Web.Calls, :add_default_json_resp}
      ],
      opts: opts
    })
  end

  @type end__200_json_resp :: %{ok: true}

  @type end__default_json_resp :: %{ok: false}

  @doc """
  post `/calls.end`

  Ends a Call.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/calls.end)

  """
  @spec end_(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Calls.end__200_json_resp()}
          | {:error, SlackOpenApi.Web.Calls.end__default_json_resp()}
  def end_(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Calls, :end_},
      url: "/calls.end",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Calls, :end__200_json_resp}},
        default: {SlackOpenApi.Web.Calls, :end__default_json_resp}
      ],
      opts: opts
    })
  end

  @type info_200_json_resp :: %{ok: true}

  @type info_default_json_resp :: %{ok: false}

  @doc """
  get `/calls.info`

  Returns information about a Call.

  ## Options

    * `id`: `id` of the Call returned by the [`calls.add`](/methods/calls.add) method.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/calls.info)

  """
  @spec info(opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Calls.info_200_json_resp()}
          | {:error, SlackOpenApi.Web.Calls.info_default_json_resp()}
  def info(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:id])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Calls, :info},
      url: "/calls.info",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Calls, :info_200_json_resp}},
        default: {SlackOpenApi.Web.Calls, :info_default_json_resp}
      ],
      opts: opts
    })
  end

  @type update_200_json_resp :: %{ok: true}

  @type update_default_json_resp :: %{ok: false}

  @doc """
  post `/calls.update`

  Updates information about a Call.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/calls.update)

  """
  @spec update(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Calls.update_200_json_resp()}
          | {:error, SlackOpenApi.Web.Calls.update_default_json_resp()}
  def update(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Calls, :update},
      url: "/calls.update",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Calls, :update_200_json_resp}},
        default: {SlackOpenApi.Web.Calls, :update_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:add_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:add_default_json_resp) do
    [ok: {:const, false}]
  end

  def __fields__(:end__200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:end__default_json_resp) do
    [ok: {:const, false}]
  end

  def __fields__(:info_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:info_default_json_resp) do
    [ok: {:const, false}]
  end

  def __fields__(:update_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:update_default_json_resp) do
    [ok: {:const, false}]
  end
end
