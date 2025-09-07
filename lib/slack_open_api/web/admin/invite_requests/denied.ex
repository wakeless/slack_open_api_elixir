defmodule SlackOpenApi.Web.Admin.InviteRequests.Denied do
  @moduledoc """
  Provides API endpoint related to admin/invite requests/denied
  """

  @default_client SlackOpenApi.Client

  @type list_200_json_resp :: %{ok: true}

  @type list_default_json_resp :: %{ok: false}

  @doc """
  post `/admin.inviteRequests.denied.list`

  List all denied workspace invite requests.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`
    * **Description**: Request body with the following parameters:
      * `team_id`: ID for the workspace where the invite requests were made.
      * `cursor`: Value of the `next_cursor` field sent as part of the previous api response
      * `limit`: The number of results that will be returned by the API on each invocation. Must be between 1 - 1000 both inclusive

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.inviteRequests.denied.list)

  """
  @spec list(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Admin.InviteRequests.Denied.list_200_json_resp()}
          | {:error, SlackOpenApi.Web.Admin.InviteRequests.Denied.list_default_json_resp()}
  def list(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin.InviteRequests.Denied, :list},
      url: "/admin.inviteRequests.denied.list",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Admin.InviteRequests.Denied, :list_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.InviteRequests.Denied, :list_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:list_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:list_default_json_resp) do
    [ok: {:const, false}]
  end
end
