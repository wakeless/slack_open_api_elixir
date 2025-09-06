defmodule SlackOpenApi.Web.Admin do
  @moduledoc """
  Provides API endpoints related to admin
  """

  @default_client SlackOpenApi.Client

  @doc """
  post `/admin.apps.approve`

  Approve an app for installation on a workspace.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.apps.approve)

  """
  @spec admin_apps_approve(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_apps_approve(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin, :admin_apps_approve},
      url: "/admin.apps.approve",
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
  get `/admin.apps.approved.list`

  List approved apps for an org or workspace.

  ## Options

    * `token`: Authentication token. Requires scope: `admin.apps:read`
    * `limit`: The maximum number of items to return. Must be between 1 - 1000 both inclusive.
    * `cursor`: Set `cursor` to `next_cursor` returned by the previous call to list items in the next page
    * `team_id`
    * `enterprise_id`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.apps.approved.list)

  """
  @spec admin_apps_approved_list(keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_apps_approved_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:cursor, :enterprise_id, :limit, :team_id, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Admin, :admin_apps_approved_list},
      url: "/admin.apps.approved.list",
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
  get `/admin.apps.requests.list`

  List app requests for a team/workspace.

  ## Options

    * `token`: Authentication token. Requires scope: `admin.apps:read`
    * `limit`: The maximum number of items to return. Must be between 1 - 1000 both inclusive.
    * `cursor`: Set `cursor` to `next_cursor` returned by the previous call to list items in the next page
    * `team_id`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.apps.requests.list)

  """
  @spec admin_apps_requests_list(keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_apps_requests_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:cursor, :limit, :team_id, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Admin, :admin_apps_requests_list},
      url: "/admin.apps.requests.list",
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
  post `/admin.apps.restrict`

  Restrict an app for installation on a workspace.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.apps.restrict)

  """
  @spec admin_apps_restrict(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_apps_restrict(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin, :admin_apps_restrict},
      url: "/admin.apps.restrict",
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
  get `/admin.apps.restricted.list`

  List restricted apps for an org or workspace.

  ## Options

    * `token`: Authentication token. Requires scope: `admin.apps:read`
    * `limit`: The maximum number of items to return. Must be between 1 - 1000 both inclusive.
    * `cursor`: Set `cursor` to `next_cursor` returned by the previous call to list items in the next page
    * `team_id`
    * `enterprise_id`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.apps.restricted.list)

  """
  @spec admin_apps_restricted_list(keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_apps_restricted_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:cursor, :enterprise_id, :limit, :team_id, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Admin, :admin_apps_restricted_list},
      url: "/admin.apps.restricted.list",
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
  post `/admin.conversations.archive`

  Archive a public or private channel.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.conversations.archive)

  """
  @spec admin_conversations_archive(map, keyword) ::
          {:ok, SlackOpenApi.Web.AdminConversationsArchiveSchema.t()}
          | {:error, SlackOpenApi.Web.AdminConversationsArchiveErrorSchema.t()}
  def admin_conversations_archive(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin, :admin_conversations_archive},
      url: "/admin.conversations.archive",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.AdminConversationsArchiveSchema, :t}},
        default: {SlackOpenApi.Web.AdminConversationsArchiveErrorSchema, :t}
      ],
      opts: opts
    })
  end

  @doc """
  post `/admin.conversations.convertToPrivate`

  Convert a public channel to a private channel.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.conversations.convertToPrivate)

  """
  @spec admin_conversations_convert_to_private(map, keyword) ::
          {:ok, SlackOpenApi.Web.AdminConversationsConvertToPrivateSchema.t()}
          | {:error, SlackOpenApi.Web.AdminConversationsConvertToPrivateErrorSchema.t()}
  def admin_conversations_convert_to_private(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin, :admin_conversations_convert_to_private},
      url: "/admin.conversations.convertToPrivate",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.AdminConversationsConvertToPrivateSchema, :t}},
        default: {SlackOpenApi.Web.AdminConversationsConvertToPrivateErrorSchema, :t}
      ],
      opts: opts
    })
  end

  @doc """
  post `/admin.conversations.create`

  Create a public or private channel-based conversation.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.conversations.create)

  """
  @spec admin_conversations_create(map, keyword) ::
          {:ok, SlackOpenApi.Web.AdminConversationsCreateSchema.t()}
          | {:error, SlackOpenApi.Web.AdminConversationsCreateErrorSchema.t()}
  def admin_conversations_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin, :admin_conversations_create},
      url: "/admin.conversations.create",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.AdminConversationsCreateSchema, :t}},
        default: {SlackOpenApi.Web.AdminConversationsCreateErrorSchema, :t}
      ],
      opts: opts
    })
  end

  @doc """
  post `/admin.conversations.delete`

  Delete a public or private channel.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.conversations.delete)

  """
  @spec admin_conversations_delete(map, keyword) ::
          {:ok, SlackOpenApi.Web.AdminConversationsDeleteSchema.t()}
          | {:error, SlackOpenApi.Web.AdminConversationsDeleteErrorSchema.t()}
  def admin_conversations_delete(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin, :admin_conversations_delete},
      url: "/admin.conversations.delete",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.AdminConversationsDeleteSchema, :t}},
        default: {SlackOpenApi.Web.AdminConversationsDeleteErrorSchema, :t}
      ],
      opts: opts
    })
  end

  @doc """
  post `/admin.conversations.disconnectShared`

  Disconnect a connected channel from one or more workspaces.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.conversations.disconnectShared)

  """
  @spec admin_conversations_disconnect_shared(map, keyword) ::
          {:ok, SlackOpenApi.Web.AdminConversationsRenameSchema.t()}
          | {:error, SlackOpenApi.Web.AdminConversationsDisconnectSharedErrorSchema.t()}
  def admin_conversations_disconnect_shared(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin, :admin_conversations_disconnect_shared},
      url: "/admin.conversations.disconnectShared",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.AdminConversationsRenameSchema, :t}},
        default: {SlackOpenApi.Web.AdminConversationsDisconnectSharedErrorSchema, :t}
      ],
      opts: opts
    })
  end

  @doc """
  get `/admin.conversations.ekm.listOriginalConnectedChannelInfo`

  List all disconnected channels—i.e., channels that were once connected to other workspaces and then disconnected—and the corresponding original channel IDs for key revocation with EKM.

  ## Options

    * `token`: Authentication token. Requires scope: `admin.conversations:read`
    * `channel_ids`: A comma-separated list of channels to filter to.
    * `team_ids`: A comma-separated list of the workspaces to which the channels you would like returned belong.
    * `limit`: The maximum number of items to return. Must be between 1 - 1000 both inclusive.
    * `cursor`: Set `cursor` to `next_cursor` returned by the previous call to list items in the next page.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.conversations.ekm.listOriginalConnectedChannelInfo)

  """
  @spec admin_conversations_ekm_list_original_connected_channel_info(keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_conversations_ekm_list_original_connected_channel_info(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:channel_ids, :cursor, :limit, :team_ids, :token])

    client.request(%{
      args: [],
      call:
        {SlackOpenApi.Web.Admin, :admin_conversations_ekm_list_original_connected_channel_info},
      url: "/admin.conversations.ekm.listOriginalConnectedChannelInfo",
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
  get `/admin.conversations.getConversationPrefs`

  Get conversation preferences for a public or private channel.

  ## Options

    * `channel_id`: The channel to get preferences for.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.conversations.getConversationPrefs)

  """
  @spec admin_conversations_get_conversation_prefs(keyword) ::
          {:ok, SlackOpenApi.Web.AdminConversationsGetConversationPrefsSchema.t()}
          | {:error, SlackOpenApi.Web.AdminConversationsUnarchiveErrorSchema.t()}
  def admin_conversations_get_conversation_prefs(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:channel_id])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Admin, :admin_conversations_get_conversation_prefs},
      url: "/admin.conversations.getConversationPrefs",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.AdminConversationsGetConversationPrefsSchema, :t}},
        default: {SlackOpenApi.Web.AdminConversationsUnarchiveErrorSchema, :t}
      ],
      opts: opts
    })
  end

  @doc """
  get `/admin.conversations.getTeams`

  Get all the workspaces a given public or private channel is connected to within this Enterprise org.

  ## Options

    * `channel_id`: The channel to determine connected workspaces within the organization for.
    * `cursor`: Set `cursor` to `next_cursor` returned by the previous call to list items in the next page
    * `limit`: The maximum number of items to return. Must be between 1 - 1000 both inclusive.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.conversations.getTeams)

  """
  @spec admin_conversations_get_teams(keyword) ::
          {:ok, SlackOpenApi.Web.AdminConversationsGetTeamsSchema.t()}
          | {:error, SlackOpenApi.Web.AdminConversationsGetTeamsErrorSchema.t()}
  def admin_conversations_get_teams(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:channel_id, :cursor, :limit])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Admin, :admin_conversations_get_teams},
      url: "/admin.conversations.getTeams",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.AdminConversationsGetTeamsSchema, :t}},
        default: {SlackOpenApi.Web.AdminConversationsGetTeamsErrorSchema, :t}
      ],
      opts: opts
    })
  end

  @doc """
  post `/admin.conversations.invite`

  Invite a user to a public or private channel.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.conversations.invite)

  """
  @spec admin_conversations_invite(map, keyword) ::
          {:ok, SlackOpenApi.Web.AdminConversationsInviteSchema.t()}
          | {:error, SlackOpenApi.Web.AdminConversationsInviteErrorSchema.t()}
  def admin_conversations_invite(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin, :admin_conversations_invite},
      url: "/admin.conversations.invite",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.AdminConversationsInviteSchema, :t}},
        default: {SlackOpenApi.Web.AdminConversationsInviteErrorSchema, :t}
      ],
      opts: opts
    })
  end

  @doc """
  post `/admin.conversations.rename`

  Rename a public or private channel.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.conversations.rename)

  """
  @spec admin_conversations_rename(map, keyword) ::
          {:ok, SlackOpenApi.Web.AdminConversationsRenameSchema.t()}
          | {:error, SlackOpenApi.Web.AdminConversationsUnarchiveErrorSchema.t()}
  def admin_conversations_rename(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin, :admin_conversations_rename},
      url: "/admin.conversations.rename",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.AdminConversationsRenameSchema, :t}},
        default: {SlackOpenApi.Web.AdminConversationsUnarchiveErrorSchema, :t}
      ],
      opts: opts
    })
  end

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
      call: {SlackOpenApi.Web.Admin, :admin_conversations_restrict_access_add_group},
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
      call: {SlackOpenApi.Web.Admin, :admin_conversations_restrict_access_list_groups},
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
      call: {SlackOpenApi.Web.Admin, :admin_conversations_restrict_access_remove_group},
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

  @doc """
  get `/admin.conversations.search`

  Search for public or private channels in an Enterprise organization.

  ## Options

    * `team_ids`: Comma separated string of team IDs, signifying the workspaces to search through.
    * `query`: Name of the the channel to query by.
    * `limit`: Maximum number of items to be returned. Must be between 1 - 20 both inclusive. Default is 10.
    * `cursor`: Set `cursor` to `next_cursor` returned by the previous call to list items in the next page.
    * `search_channel_types`: The type of channel to include or exclude in the search. For example `private` will search private channels, while `private_exclude` will exclude them. For a full list of types, check the [Types section](#types).
    * `sort`: Possible values are `relevant` (search ranking based on what we think is closest), `name` (alphabetical), `member_count` (number of users in the channel), and `created` (date channel was created). You can optionally pair this with the `sort_dir` arg to change how it is sorted 
    * `sort_dir`: Sort direction. Possible values are `asc` for ascending order like (1, 2, 3) or (a, b, c), and `desc` for descending order like (3, 2, 1) or (c, b, a)

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.conversations.search)

  """
  @spec admin_conversations_search(keyword) ::
          {:ok, SlackOpenApi.Web.AdminConversationsSearchSchema.t()}
          | {:error, SlackOpenApi.Web.AdminConversationsSearchErrorSchema.t()}
  def admin_conversations_search(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :cursor,
        :limit,
        :query,
        :search_channel_types,
        :sort,
        :sort_dir,
        :team_ids
      ])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Admin, :admin_conversations_search},
      url: "/admin.conversations.search",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.AdminConversationsSearchSchema, :t}},
        default: {SlackOpenApi.Web.AdminConversationsSearchErrorSchema, :t}
      ],
      opts: opts
    })
  end

  @doc """
  post `/admin.conversations.setConversationPrefs`

  Set the posting permissions for a public or private channel.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.conversations.setConversationPrefs)

  """
  @spec admin_conversations_set_conversation_prefs(map, keyword) ::
          {:ok, SlackOpenApi.Web.AdminConversationsSetConversationPrefsSchema.t()}
          | {:error, SlackOpenApi.Web.AdminConversationsSetConversationPrefsErrorSchema.t()}
  def admin_conversations_set_conversation_prefs(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin, :admin_conversations_set_conversation_prefs},
      url: "/admin.conversations.setConversationPrefs",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.AdminConversationsSetConversationPrefsSchema, :t}},
        default: {SlackOpenApi.Web.AdminConversationsSetConversationPrefsErrorSchema, :t}
      ],
      opts: opts
    })
  end

  @doc """
  post `/admin.conversations.setTeams`

  Set the workspaces in an Enterprise grid org that connect to a public or private channel.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.conversations.setTeams)

  """
  @spec admin_conversations_set_teams(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_conversations_set_teams(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin, :admin_conversations_set_teams},
      url: "/admin.conversations.setTeams",
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
  post `/admin.conversations.unarchive`

  Unarchive a public or private channel.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.conversations.unarchive)

  """
  @spec admin_conversations_unarchive(map, keyword) ::
          {:ok, SlackOpenApi.Web.AdminConversationsUnarchiveSchema.t()}
          | {:error, SlackOpenApi.Web.AdminConversationsUnarchiveErrorSchema.t()}
  def admin_conversations_unarchive(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin, :admin_conversations_unarchive},
      url: "/admin.conversations.unarchive",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.AdminConversationsUnarchiveSchema, :t}},
        default: {SlackOpenApi.Web.AdminConversationsUnarchiveErrorSchema, :t}
      ],
      opts: opts
    })
  end

  @doc """
  post `/admin.emoji.add`

  Add an emoji.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.emoji.add)

  """
  @spec admin_emoji_add(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_emoji_add(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin, :admin_emoji_add},
      url: "/admin.emoji.add",
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
  post `/admin.emoji.addAlias`

  Add an emoji alias.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.emoji.addAlias)

  """
  @spec admin_emoji_add_alias(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_emoji_add_alias(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin, :admin_emoji_add_alias},
      url: "/admin.emoji.addAlias",
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
  get `/admin.emoji.list`

  List emoji for an Enterprise Grid organization.

  ## Options

    * `token`: Authentication token. Requires scope: `admin.teams:read`
    * `cursor`: Set `cursor` to `next_cursor` returned by the previous call to list items in the next page
    * `limit`: The maximum number of items to return. Must be between 1 - 1000 both inclusive.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.emoji.list)

  """
  @spec admin_emoji_list(keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_emoji_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:cursor, :limit, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Admin, :admin_emoji_list},
      url: "/admin.emoji.list",
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
  post `/admin.emoji.remove`

  Remove an emoji across an Enterprise Grid organization

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.emoji.remove)

  """
  @spec admin_emoji_remove(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_emoji_remove(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin, :admin_emoji_remove},
      url: "/admin.emoji.remove",
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
  post `/admin.emoji.rename`

  Rename an emoji.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.emoji.rename)

  """
  @spec admin_emoji_rename(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_emoji_rename(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin, :admin_emoji_rename},
      url: "/admin.emoji.rename",
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
      call: {SlackOpenApi.Web.Admin, :admin_invite_requests_approve},
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
      call: {SlackOpenApi.Web.Admin, :admin_invite_requests_approved_list},
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

  @doc """
  get `/admin.inviteRequests.denied.list`

  List all denied workspace invite requests.

  ## Options

    * `team_id`: ID for the workspace where the invite requests were made.
    * `cursor`: Value of the `next_cursor` field sent as part of the previous api response
    * `limit`: The number of results that will be returned by the API on each invocation. Must be between 1 - 1000 both inclusive

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.inviteRequests.denied.list)

  """
  @spec admin_invite_requests_denied_list(keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_invite_requests_denied_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:cursor, :limit, :team_id])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Admin, :admin_invite_requests_denied_list},
      url: "/admin.inviteRequests.denied.list",
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
      call: {SlackOpenApi.Web.Admin, :admin_invite_requests_deny},
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
      call: {SlackOpenApi.Web.Admin, :admin_invite_requests_list},
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

  @doc """
  get `/admin.teams.admins.list`

  List all of the admins on a given workspace.

  ## Options

    * `token`: Authentication token. Requires scope: `admin.teams:read`
    * `limit`: The maximum number of items to return.
    * `cursor`: Set `cursor` to `next_cursor` returned by the previous call to list items in the next page.
    * `team_id`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.teams.admins.list)

  """
  @spec admin_teams_admins_list(keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_teams_admins_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:cursor, :limit, :team_id, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Admin, :admin_teams_admins_list},
      url: "/admin.teams.admins.list",
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
  post `/admin.teams.create`

  Create an Enterprise team.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.teams.create)

  """
  @spec admin_teams_create(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_teams_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin, :admin_teams_create},
      url: "/admin.teams.create",
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
  get `/admin.teams.list`

  List all teams on an Enterprise organization

  ## Options

    * `limit`: The maximum number of items to return. Must be between 1 - 100 both inclusive.
    * `cursor`: Set `cursor` to `next_cursor` returned by the previous call to list items in the next page.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.teams.list)

  """
  @spec admin_teams_list(keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_teams_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:cursor, :limit])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Admin, :admin_teams_list},
      url: "/admin.teams.list",
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
  get `/admin.teams.owners.list`

  List all of the owners on a given workspace.

  ## Options

    * `token`: Authentication token. Requires scope: `admin.teams:read`
    * `team_id`
    * `limit`: The maximum number of items to return. Must be between 1 - 1000 both inclusive.
    * `cursor`: Set `cursor` to `next_cursor` returned by the previous call to list items in the next page.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.teams.owners.list)

  """
  @spec admin_teams_owners_list(keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_teams_owners_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:cursor, :limit, :team_id, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Admin, :admin_teams_owners_list},
      url: "/admin.teams.owners.list",
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
  get `/admin.teams.settings.info`

  Fetch information about settings in a workspace

  ## Options

    * `team_id`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.teams.settings.info)

  """
  @spec admin_teams_settings_info(keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_teams_settings_info(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:team_id])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Admin, :admin_teams_settings_info},
      url: "/admin.teams.settings.info",
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
  post `/admin.teams.settings.setDefaultChannels`

  Set the default channels of a workspace.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.teams.settings.setDefaultChannels)

  """
  @spec admin_teams_settings_set_default_channels(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_teams_settings_set_default_channels(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin, :admin_teams_settings_set_default_channels},
      url: "/admin.teams.settings.setDefaultChannels",
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
  post `/admin.teams.settings.setDescription`

  Set the description of a given workspace.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.teams.settings.setDescription)

  """
  @spec admin_teams_settings_set_description(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_teams_settings_set_description(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin, :admin_teams_settings_set_description},
      url: "/admin.teams.settings.setDescription",
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
  post `/admin.teams.settings.setDiscoverability`

  An API method that allows admins to set the discoverability of a given workspace

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.teams.settings.setDiscoverability)

  """
  @spec admin_teams_settings_set_discoverability(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_teams_settings_set_discoverability(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin, :admin_teams_settings_set_discoverability},
      url: "/admin.teams.settings.setDiscoverability",
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
  post `/admin.teams.settings.setIcon`

  Sets the icon of a workspace.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.teams.settings.setIcon)

  """
  @spec admin_teams_settings_set_icon(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_teams_settings_set_icon(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin, :admin_teams_settings_set_icon},
      url: "/admin.teams.settings.setIcon",
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
  post `/admin.teams.settings.setName`

  Set the name of a given workspace.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.teams.settings.setName)

  """
  @spec admin_teams_settings_set_name(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_teams_settings_set_name(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin, :admin_teams_settings_set_name},
      url: "/admin.teams.settings.setName",
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
      call: {SlackOpenApi.Web.Admin, :admin_usergroups_add_channels},
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
      call: {SlackOpenApi.Web.Admin, :admin_usergroups_add_teams},
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
      call: {SlackOpenApi.Web.Admin, :admin_usergroups_list_channels},
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
      call: {SlackOpenApi.Web.Admin, :admin_usergroups_remove_channels},
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

  @doc """
  post `/admin.users.assign`

  Add an Enterprise user to a workspace.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.users.assign)

  """
  @spec admin_users_assign(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_users_assign(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin, :admin_users_assign},
      url: "/admin.users.assign",
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
  post `/admin.users.invite`

  Invite a user to a workspace.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.users.invite)

  """
  @spec admin_users_invite(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_users_invite(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin, :admin_users_invite},
      url: "/admin.users.invite",
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
  get `/admin.users.list`

  List users on a workspace

  ## Options

    * `team_id`: The ID (`T1234`) of the workspace.
    * `cursor`: Set `cursor` to `next_cursor` returned by the previous call to list items in the next page.
    * `limit`: Limit for how many users to be retrieved per page

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.users.list)

  """
  @spec admin_users_list(keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_users_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:cursor, :limit, :team_id])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Admin, :admin_users_list},
      url: "/admin.users.list",
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
  post `/admin.users.remove`

  Remove a user from a workspace.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.users.remove)

  """
  @spec admin_users_remove(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_users_remove(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin, :admin_users_remove},
      url: "/admin.users.remove",
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
  post `/admin.users.session.invalidate`

  Invalidate a single session for a user by session_id

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.users.session.invalidate)

  """
  @spec admin_users_session_invalidate(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_users_session_invalidate(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin, :admin_users_session_invalidate},
      url: "/admin.users.session.invalidate",
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
  post `/admin.users.session.reset`

  Wipes all valid sessions on all devices for a given user

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.users.session.reset)

  """
  @spec admin_users_session_reset(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_users_session_reset(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin, :admin_users_session_reset},
      url: "/admin.users.session.reset",
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
  post `/admin.users.setAdmin`

  Set an existing guest, regular user, or owner to be an admin user.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.users.setAdmin)

  """
  @spec admin_users_set_admin(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_users_set_admin(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin, :admin_users_set_admin},
      url: "/admin.users.setAdmin",
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
  post `/admin.users.setExpiration`

  Set an expiration for a guest user

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.users.setExpiration)

  """
  @spec admin_users_set_expiration(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_users_set_expiration(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin, :admin_users_set_expiration},
      url: "/admin.users.setExpiration",
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
  post `/admin.users.setOwner`

  Set an existing guest, regular user, or admin user to be a workspace owner.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.users.setOwner)

  """
  @spec admin_users_set_owner(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_users_set_owner(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin, :admin_users_set_owner},
      url: "/admin.users.setOwner",
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
  post `/admin.users.setRegular`

  Set an existing guest user, admin user, or owner to be a regular user.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.users.setRegular)

  """
  @spec admin_users_set_regular(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_users_set_regular(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin, :admin_users_set_regular},
      url: "/admin.users.setRegular",
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
