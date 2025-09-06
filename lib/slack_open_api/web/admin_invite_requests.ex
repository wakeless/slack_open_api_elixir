defmodule SlackOpenApi.Web.AdminInviteRequests do
  @moduledoc """
  Provides API endpoints related to admin invite requests
  """

  @default_client SlackOpenApi.Client

  @doc """
  post `/admin.inviteRequests.approve`

  Approve a workspace invite request.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.inviteRequests.approve)

  """
  @spec admin_invite_requests_approve(keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_invite_requests_approve(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.AdminInviteRequests, :admin_invite_requests_approve},
      url: "/admin.inviteRequests.approve",
      method: :post,
      response: [
        {200, {SlackOpenApi.Web.DefaultSuccessTemplate, :t}},
        default: {SlackOpenApi.Web.DefaultErrorTemplate, :t}
      ],
      opts: opts
    })
  end

  @doc """
  post `/admin.inviteRequests.deny`

  Deny a workspace invite request.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.inviteRequests.deny)

  """
  @spec admin_invite_requests_deny(keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_invite_requests_deny(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.AdminInviteRequests, :admin_invite_requests_deny},
      url: "/admin.inviteRequests.deny",
      method: :post,
      response: [
        {200, {SlackOpenApi.Web.DefaultSuccessTemplate, :t}},
        default: {SlackOpenApi.Web.DefaultErrorTemplate, :t}
      ],
      opts: opts
    })
  end

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
  @spec admin_invite_requests_list(keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_invite_requests_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:cursor, :limit, :team_id])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.AdminInviteRequests, :admin_invite_requests_list},
      url: "/admin.inviteRequests.list",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.DefaultSuccessTemplate, :t}},
        default: {SlackOpenApi.Web.DefaultErrorTemplate, :t}
      ],
      opts: opts
    })
  end
end
