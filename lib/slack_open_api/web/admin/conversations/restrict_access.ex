defmodule SlackOpenApi.Web.Admin.Conversations.RestrictAccess do
  @moduledoc """
  Provides API endpoints related to admin/conversations/restrict access
  """

  @default_client SlackOpenApi.Client

  @type add_group_200_json_resp :: %{ok: true}

  @type add_group_default_json_resp :: %{ok: false}

  @doc """
  post `/admin.conversations.restrictAccess.addGroup`

  Add an allowlist of IDP groups for accessing a channel

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.conversations.restrictAccess.addGroup)

  """
  @spec add_group(map, keyword) :: {:ok, map} | {:error, map}
  def add_group(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin.Conversations.RestrictAccess, :add_group},
      url: "/admin.conversations.restrictAccess.addGroup",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Admin.Conversations.RestrictAccess, :add_group_200_json_resp}},
        default:
          {SlackOpenApi.Web.Admin.Conversations.RestrictAccess, :add_group_default_json_resp}
      ],
      opts: opts
    })
  end

  @type list_groups_200_json_resp :: %{ok: true}

  @type list_groups_default_json_resp :: %{ok: false}

  @doc """
  get `/admin.conversations.restrictAccess.listGroups`

  List all IDP Groups linked to a channel

  ## Options

    * `token`: Authentication token. Requires scope: `admin.conversations:read`
    * `channel_id`
    * `team_id`: The workspace where the channel exists. This argument is required for channels only tied to one workspace, and optional for channels that are shared across an organization.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.conversations.restrictAccess.listGroups)

  """
  @spec list_groups(keyword) :: {:ok, map} | {:error, map}
  def list_groups(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:channel_id, :team_id, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Admin.Conversations.RestrictAccess, :list_groups},
      url: "/admin.conversations.restrictAccess.listGroups",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Admin.Conversations.RestrictAccess, :list_groups_200_json_resp}},
        default:
          {SlackOpenApi.Web.Admin.Conversations.RestrictAccess, :list_groups_default_json_resp}
      ],
      opts: opts
    })
  end

  @type remove_group_200_json_resp :: %{ok: true}

  @type remove_group_default_json_resp :: %{ok: false}

  @doc """
  post `/admin.conversations.restrictAccess.removeGroup`

  Remove a linked IDP group linked from a private channel

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.conversations.restrictAccess.removeGroup)

  """
  @spec remove_group(map, keyword) :: {:ok, map} | {:error, map}
  def remove_group(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin.Conversations.RestrictAccess, :remove_group},
      url: "/admin.conversations.restrictAccess.removeGroup",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Admin.Conversations.RestrictAccess, :remove_group_200_json_resp}},
        default:
          {SlackOpenApi.Web.Admin.Conversations.RestrictAccess, :remove_group_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:add_group_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:add_group_default_json_resp) do
    [ok: {:const, false}]
  end

  def __fields__(:list_groups_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:list_groups_default_json_resp) do
    [ok: {:const, false}]
  end

  def __fields__(:remove_group_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:remove_group_default_json_resp) do
    [ok: {:const, false}]
  end
end
