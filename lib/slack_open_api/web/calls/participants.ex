defmodule SlackOpenApi.Web.Calls.Participants do
  @moduledoc """
  Provides API endpoints related to calls/participants
  """

  @default_client SlackOpenApi.Client

  @type add_200_json_resp :: %{ok: true}

  @type add_default_json_resp :: %{ok: false}

  @doc """
  post `/calls.participants.add`

  Registers new participants added to a Call.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/calls.participants.add)

  """
  @spec add(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Calls.Participants.add_200_json_resp()}
          | {:error, SlackOpenApi.Web.Calls.Participants.add_default_json_resp()}
  def add(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Calls.Participants, :add},
      url: "/calls.participants.add",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Calls.Participants, :add_200_json_resp}},
        default: {SlackOpenApi.Web.Calls.Participants, :add_default_json_resp}
      ],
      opts: opts
    })
  end

  @type remove_200_json_resp :: %{ok: true}

  @type remove_default_json_resp :: %{ok: false}

  @doc """
  post `/calls.participants.remove`

  Registers participants removed from a Call.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/calls.participants.remove)

  """
  @spec remove(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Calls.Participants.remove_200_json_resp()}
          | {:error, SlackOpenApi.Web.Calls.Participants.remove_default_json_resp()}
  def remove(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Calls.Participants, :remove},
      url: "/calls.participants.remove",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Calls.Participants, :remove_200_json_resp}},
        default: {SlackOpenApi.Web.Calls.Participants, :remove_default_json_resp}
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

  def __fields__(:remove_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:remove_default_json_resp) do
    [ok: {:const, false}]
  end
end
