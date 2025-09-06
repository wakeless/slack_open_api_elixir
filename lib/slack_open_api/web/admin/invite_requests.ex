defmodule SlackOpenApi.Web.Admin.InviteRequests do
  @moduledoc """
  Provides API endpoints related to admin/invite requests
  """

  @default_client SlackOpenApi.Client

  @type approve_200_json_resp :: %{ok: true}

  @type approve_default_json_resp :: %{ok: false}

  @doc """
  post `/admin.inviteRequests.approve`

  Approve a workspace invite request.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.inviteRequests.approve)

  """
  @spec approve(keyword) :: {:ok, map} | {:error, map}
  def approve(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Admin.InviteRequests, :approve},
      url: "/admin.inviteRequests.approve",
      method: :post,
      response: [
        {200, {SlackOpenApi.Web.Admin.InviteRequests, :approve_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.InviteRequests, :approve_default_json_resp}
      ],
      opts: opts
    })
  end

  @type deny_200_json_resp :: %{ok: true}

  @type deny_default_json_resp :: %{ok: false}

  @doc """
  post `/admin.inviteRequests.deny`

  Deny a workspace invite request.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.inviteRequests.deny)

  """
  @spec deny(keyword) :: {:ok, map} | {:error, map}
  def deny(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Admin.InviteRequests, :deny},
      url: "/admin.inviteRequests.deny",
      method: :post,
      response: [
        {200, {SlackOpenApi.Web.Admin.InviteRequests, :deny_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.InviteRequests, :deny_default_json_resp}
      ],
      opts: opts
    })
  end

  @type list_200_json_resp :: %{ok: true}

  @type list_default_json_resp :: %{ok: false}

  @doc """
  get `/admin.inviteRequests.list`

  List all pending workspace invite requests.

  ## Options

    * `team_id`: ID for the workspace where the invite requests were made.
    * `cursor`: Value of the `next_cursor` field sent as part of the previous API response
    * `limit`: The number of results that will be returned by the API on each invocation. Must be between 1 - 1000, both inclusive

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.inviteRequests.list)

  """
  @spec list(keyword) :: {:ok, map} | {:error, map}
  def list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:cursor, :limit, :team_id])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Admin.InviteRequests, :list},
      url: "/admin.inviteRequests.list",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Admin.InviteRequests, :list_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.InviteRequests, :list_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:approve_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:approve_default_json_resp) do
    [ok: {:const, false}]
  end

  def __fields__(:deny_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:deny_default_json_resp) do
    [ok: {:const, false}]
  end

  def __fields__(:list_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:list_default_json_resp) do
    [ok: {:const, false}]
  end
end
