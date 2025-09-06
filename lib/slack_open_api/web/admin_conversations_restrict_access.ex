defmodule SlackOpenApi.Web.AdminConversationsRestrictAccess do
  @moduledoc """
  Provides API endpoints related to admin conversations restrict access
  """

  @default_client SlackOpenApi.Client

  @doc """
  post `/admin.conversations.restrictAccess.addGroup`

  Add an allowlist of IDP groups for accessing a channel

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.conversations.restrictAccess.addGroup)

  """
  @spec admin_conversations_restrict_access_add_group(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_conversations_restrict_access_add_group(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call:
        {SlackOpenApi.Web.AdminConversationsRestrictAccess,
         :admin_conversations_restrict_access_add_group},
      url: "/admin.conversations.restrictAccess.addGroup",
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
  get `/admin.conversations.restrictAccess.listGroups`

  List all IDP Groups linked to a channel

  ## Options

    * `token`: Authentication token. Requires scope: `admin.conversations:read`
    * `channel_id`
    * `team_id`: The workspace where the channel exists. This argument is required for channels only tied to one workspace, and optional for channels that are shared across an organization.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.conversations.restrictAccess.listGroups)

  """
  @spec admin_conversations_restrict_access_list_groups(keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_conversations_restrict_access_list_groups(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:channel_id, :team_id, :token])

    client.request(%{
      args: [],
      call:
        {SlackOpenApi.Web.AdminConversationsRestrictAccess,
         :admin_conversations_restrict_access_list_groups},
      url: "/admin.conversations.restrictAccess.listGroups",
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
  post `/admin.conversations.restrictAccess.removeGroup`

  Remove a linked IDP group linked from a private channel

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.conversations.restrictAccess.removeGroup)

  """
  @spec admin_conversations_restrict_access_remove_group(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_conversations_restrict_access_remove_group(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call:
        {SlackOpenApi.Web.AdminConversationsRestrictAccess,
         :admin_conversations_restrict_access_remove_group},
      url: "/admin.conversations.restrictAccess.removeGroup",
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
