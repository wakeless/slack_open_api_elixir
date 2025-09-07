defmodule SlackOpenApi.Web.Admin.Usergroups do
  @moduledoc """
  Provides API endpoints related to admin/usergroups
  """

  @default_client SlackOpenApi.Client

  @type add_channels_200_json_resp :: %{ok: true}

  @type add_channels_default_json_resp :: %{ok: false}

  @doc """
  post `/admin.usergroups.addChannels`

  Add one or more default channels to an IDP group.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.usergroups.addChannels)

  """
  @spec add_channels(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Admin.Usergroups.add_channels_200_json_resp()}
          | {:error, SlackOpenApi.Web.Admin.Usergroups.add_channels_default_json_resp()}
  def add_channels(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin.Usergroups, :add_channels},
      url: "/admin.usergroups.addChannels",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Admin.Usergroups, :add_channels_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.Usergroups, :add_channels_default_json_resp}
      ],
      opts: opts
    })
  end

  @type add_teams_200_json_resp :: %{ok: true}

  @type add_teams_default_json_resp :: %{ok: false}

  @doc """
  post `/admin.usergroups.addTeams`

  Associate one or more default workspaces with an organization-wide IDP group.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.usergroups.addTeams)

  """
  @spec add_teams(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Admin.Usergroups.add_teams_200_json_resp()}
          | {:error, SlackOpenApi.Web.Admin.Usergroups.add_teams_default_json_resp()}
  def add_teams(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin.Usergroups, :add_teams},
      url: "/admin.usergroups.addTeams",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Admin.Usergroups, :add_teams_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.Usergroups, :add_teams_default_json_resp}
      ],
      opts: opts
    })
  end

  @type list_channels_200_json_resp :: %{ok: true}

  @type list_channels_default_json_resp :: %{ok: false}

  @doc """
  post `/admin.usergroups.listChannels`

  List the channels linked to an org-level IDP group (user group).

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`
    * **Description**: Request body with the following parameters:
      * `usergroup_id` (required): ID of the IDP group to list default channels for.
      * `team_id`: ID of the the workspace.
      * `include_num_members`: Flag to include or exclude the count of members per channel.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.usergroups.listChannels)

  """
  @spec list_channels(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Admin.Usergroups.list_channels_200_json_resp()}
          | {:error, SlackOpenApi.Web.Admin.Usergroups.list_channels_default_json_resp()}
  def list_channels(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin.Usergroups, :list_channels},
      url: "/admin.usergroups.listChannels",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Admin.Usergroups, :list_channels_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.Usergroups, :list_channels_default_json_resp}
      ],
      opts: opts
    })
  end

  @type remove_channels_200_json_resp :: %{ok: true}

  @type remove_channels_default_json_resp :: %{ok: false}

  @doc """
  post `/admin.usergroups.removeChannels`

  Remove one or more default channels from an org-level IDP group (user group).

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.usergroups.removeChannels)

  """
  @spec remove_channels(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Admin.Usergroups.remove_channels_200_json_resp()}
          | {:error, SlackOpenApi.Web.Admin.Usergroups.remove_channels_default_json_resp()}
  def remove_channels(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin.Usergroups, :remove_channels},
      url: "/admin.usergroups.removeChannels",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Admin.Usergroups, :remove_channels_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.Usergroups, :remove_channels_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:add_channels_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:add_channels_default_json_resp) do
    [ok: {:const, false}]
  end

  def __fields__(:add_teams_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:add_teams_default_json_resp) do
    [ok: {:const, false}]
  end

  def __fields__(:list_channels_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:list_channels_default_json_resp) do
    [ok: {:const, false}]
  end

  def __fields__(:remove_channels_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:remove_channels_default_json_resp) do
    [ok: {:const, false}]
  end
end
