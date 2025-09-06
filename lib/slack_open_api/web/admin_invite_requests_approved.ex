defmodule SlackOpenApi.Web.AdminInviteRequestsApproved do
  @moduledoc """
  Provides API endpoint related to admin invite requests approved
  """

  @default_client SlackOpenApi.Client

  @doc """
  get `/admin.inviteRequests.approved.list`

  List all approved workspace invite requests.

  ## Options

    * `team_id`: ID for the workspace where the invite requests were made.
    * `cursor`: Value of the `next_cursor` field sent as part of the previous API response
    * `limit`: The number of results that will be returned by the API on each invocation. Must be between 1 - 1000, both inclusive

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.inviteRequests.approved.list)

  """
  @spec admin_invite_requests_approved_list(keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_invite_requests_approved_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:cursor, :limit, :team_id])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.AdminInviteRequestsApproved, :admin_invite_requests_approved_list},
      url: "/admin.inviteRequests.approved.list",
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
