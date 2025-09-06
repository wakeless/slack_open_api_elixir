defmodule SlackOpenApi.Web.AdminConversations do
  @moduledoc """
  Provides API endpoints related to admin conversations
  """

  @default_client SlackOpenApi.Client

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
      call: {SlackOpenApi.Web.AdminConversations, :admin_conversations_archive},
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
      call: {SlackOpenApi.Web.AdminConversations, :admin_conversations_convert_to_private},
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
      call: {SlackOpenApi.Web.AdminConversations, :admin_conversations_create},
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
      call: {SlackOpenApi.Web.AdminConversations, :admin_conversations_delete},
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
      call: {SlackOpenApi.Web.AdminConversations, :admin_conversations_disconnect_shared},
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
      call: {SlackOpenApi.Web.AdminConversations, :admin_conversations_get_conversation_prefs},
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
      call: {SlackOpenApi.Web.AdminConversations, :admin_conversations_get_teams},
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
      call: {SlackOpenApi.Web.AdminConversations, :admin_conversations_invite},
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
      call: {SlackOpenApi.Web.AdminConversations, :admin_conversations_rename},
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
      call: {SlackOpenApi.Web.AdminConversations, :admin_conversations_search},
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
      call: {SlackOpenApi.Web.AdminConversations, :admin_conversations_set_conversation_prefs},
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
      call: {SlackOpenApi.Web.AdminConversations, :admin_conversations_set_teams},
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
      call: {SlackOpenApi.Web.AdminConversations, :admin_conversations_unarchive},
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
end
