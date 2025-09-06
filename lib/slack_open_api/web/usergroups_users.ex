defmodule SlackOpenApi.Web.UsergroupsUsers do
  @moduledoc """
  Provides API endpoints related to usergroups users
  """

  @default_client SlackOpenApi.Client

  @doc """
  get `/usergroups.users.list`

  List all users in a User Group

  ## Options

    * `token`: Authentication token. Requires scope: `usergroups:read`
    * `include_disabled`: Allow results that involve disabled User Groups.
    * `usergroup`: The encoded ID of the User Group to update.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/usergroups.users.list)

  """
  @spec usergroups_users_list(keyword) ::
          {:ok, SlackOpenApi.Web.UsergroupsUsersListSchema.t()}
          | {:error, SlackOpenApi.Web.UsergroupsUsersListErrorSchema.t()}
  def usergroups_users_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:include_disabled, :token, :usergroup])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.UsergroupsUsers, :usergroups_users_list},
      url: "/usergroups.users.list",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.UsergroupsUsersListSchema, :t}},
        default: {SlackOpenApi.Web.UsergroupsUsersListErrorSchema, :t}
      ],
      opts: opts
    })
  end

  @doc """
  post `/usergroups.users.update`

  Update the list of users for a User Group

  ## Resources

    * [API method documentation](https://api.slack.com/methods/usergroups.users.update)

  """
  @spec usergroups_users_update(map, keyword) ::
          {:ok, SlackOpenApi.Web.UsergroupsUsersUpdateSchema.t()}
          | {:error, SlackOpenApi.Web.UsergroupsUsersUpdateErrorSchema.t()}
  def usergroups_users_update(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.UsergroupsUsers, :usergroups_users_update},
      url: "/usergroups.users.update",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.UsergroupsUsersUpdateSchema, :t}},
        default: {SlackOpenApi.Web.UsergroupsUsersUpdateErrorSchema, :t}
      ],
      opts: opts
    })
  end
end
