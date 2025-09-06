defmodule SlackOpenApi.Web.CallsParticipants do
  @moduledoc """
  Provides API endpoints related to calls participants
  """

  @default_client SlackOpenApi.Client

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
      call: {SlackOpenApi.Web.CallsParticipants, :calls_participants_add},
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
      call: {SlackOpenApi.Web.CallsParticipants, :calls_participants_remove},
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
end
