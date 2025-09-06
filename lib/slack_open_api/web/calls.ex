defmodule SlackOpenApi.Web.Calls do
  @moduledoc """
  Provides API endpoints related to calls
  """

  @default_client SlackOpenApi.Client

  @type calls_add_200_json_resp :: %{ok: true}

  @type calls_add_default_json_resp :: %{ok: false}

  @doc """
  post `/calls.add`

  Registers a new Call.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/calls.add)

  """
  @spec calls_add(map, keyword) :: {:ok, map} | {:error, map}
  def calls_add(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Calls, :calls_add},
      url: "/calls.add",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Calls, :calls_add_200_json_resp}},
        default: {SlackOpenApi.Web.Calls, :calls_add_default_json_resp}
      ],
      opts: opts
    })
  end

  @type calls_end_200_json_resp :: %{ok: true}

  @type calls_end_default_json_resp :: %{ok: false}

  @doc """
  post `/calls.end`

  Ends a Call.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/calls.end)

  """
  @spec calls_end(map, keyword) :: {:ok, map} | {:error, map}
  def calls_end(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Calls, :calls_end},
      url: "/calls.end",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Calls, :calls_end_200_json_resp}},
        default: {SlackOpenApi.Web.Calls, :calls_end_default_json_resp}
      ],
      opts: opts
    })
  end

  @type calls_info_200_json_resp :: %{ok: true}

  @type calls_info_default_json_resp :: %{ok: false}

  @doc """
  get `/calls.info`

  Returns information about a Call.

  ## Options

    * `id`: `id` of the Call returned by the [`calls.add`](/methods/calls.add) method.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/calls.info)

  """
  @spec calls_info(keyword) :: {:ok, map} | {:error, map}
  def calls_info(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:id])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Calls, :calls_info},
      url: "/calls.info",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Calls, :calls_info_200_json_resp}},
        default: {SlackOpenApi.Web.Calls, :calls_info_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc """
  post `/calls.participants.add`

  Registers new participants added to a Call.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/calls.participants.add)

  """
  @spec calls_participants_add(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def calls_participants_add(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Calls, :calls_participants_add},
      url: "/calls.participants.add",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.DefaultSuccessTemplate, :t}},
        default: {SlackOpenApi.Web.DefaultErrorTemplate, :t}
      ],
      opts: opts
    })
  end

  @doc """
  post `/calls.participants.remove`

  Registers participants removed from a Call.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/calls.participants.remove)

  """
  @spec calls_participants_remove(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def calls_participants_remove(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Calls, :calls_participants_remove},
      url: "/calls.participants.remove",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.DefaultSuccessTemplate, :t}},
        default: {SlackOpenApi.Web.DefaultErrorTemplate, :t}
      ],
      opts: opts
    })
  end

  @type calls_update_200_json_resp :: %{ok: true}

  @type calls_update_default_json_resp :: %{ok: false}

  @doc """
  post `/calls.update`

  Updates information about a Call.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/calls.update)

  """
  @spec calls_update(map, keyword) :: {:ok, map} | {:error, map}
  def calls_update(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Calls, :calls_update},
      url: "/calls.update",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Calls, :calls_update_200_json_resp}},
        default: {SlackOpenApi.Web.Calls, :calls_update_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:calls_add_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:calls_add_default_json_resp) do
    [ok: {:const, false}]
  end

  def __fields__(:calls_end_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:calls_end_default_json_resp) do
    [ok: {:const, false}]
  end

  def __fields__(:calls_info_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:calls_info_default_json_resp) do
    [ok: {:const, false}]
  end

  def __fields__(:calls_update_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:calls_update_default_json_resp) do
    [ok: {:const, false}]
  end
end
