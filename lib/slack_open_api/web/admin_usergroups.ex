defmodule SlackOpenApi.Web.AdminUsergroups do
  @moduledoc """
  Provides API endpoints related to admin usergroups
  """

  @default_client SlackOpenApi.Client

  @doc """
  post `/admin.usergroups.addChannels`

  Add one or more default channels to an IDP group.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.usergroups.addChannels)

  """
  @spec admin_usergroups_add_channels(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_usergroups_add_channels(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.AdminUsergroups, :admin_usergroups_add_channels},
      url: "/admin.usergroups.addChannels",
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
  post `/admin.usergroups.addTeams`

  Associate one or more default workspaces with an organization-wide IDP group.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.usergroups.addTeams)

  """
  @spec admin_usergroups_add_teams(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_usergroups_add_teams(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.AdminUsergroups, :admin_usergroups_add_teams},
      url: "/admin.usergroups.addTeams",
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
  get `/admin.usergroups.listChannels`

  List the channels linked to an org-level IDP group (user group).

  ## Options

    * `usergroup_id`: ID of the IDP group to list default channels for.
    * `team_id`: ID of the the workspace.
    * `include_num_members`: Flag to include or exclude the count of members per channel.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.usergroups.listChannels)

  """
  @spec admin_usergroups_list_channels(keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_usergroups_list_channels(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:include_num_members, :team_id, :usergroup_id])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.AdminUsergroups, :admin_usergroups_list_channels},
      url: "/admin.usergroups.listChannels",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.DefaultSuccessTemplate, :t}},
        default: {SlackOpenApi.Web.DefaultErrorTemplate, :t}
      ],
      opts: opts
    })
  end

  @doc """
  post `/admin.usergroups.removeChannels`

  Remove one or more default channels from an org-level IDP group (user group).

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.usergroups.removeChannels)

  """
  @spec admin_usergroups_remove_channels(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_usergroups_remove_channels(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.AdminUsergroups, :admin_usergroups_remove_channels},
      url: "/admin.usergroups.removeChannels",
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
