defmodule SlackOpenApi.Web.Admin.Conversations do
  @moduledoc """
  Provides API endpoints related to admin/conversations
  """

  @default_client SlackOpenApi.Client

  @type archive_200_json_resp :: %{ok: true}

  @type archive_default_json_resp :: %{error: String.t(), ok: false}

  @doc """
  post `/admin.conversations.archive`

  Archive a public or private channel.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.conversations.archive)

  """
  @spec archive(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Admin.Conversations.archive_200_json_resp()}
          | {:error, SlackOpenApi.Web.Admin.Conversations.archive_default_json_resp()}
  def archive(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin.Conversations, :archive},
      url: "/admin.conversations.archive",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Admin.Conversations, :archive_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.Conversations, :archive_default_json_resp}
      ],
      opts: opts
    })
  end

  @type convert_to_private_200_json_resp :: %{ok: true}

  @type convert_to_private_default_json_resp :: %{error: String.t(), ok: false}

  @doc """
  post `/admin.conversations.convertToPrivate`

  Convert a public channel to a private channel.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.conversations.convertToPrivate)

  """
  @spec convert_to_private(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Admin.Conversations.convert_to_private_200_json_resp()}
          | {:error, SlackOpenApi.Web.Admin.Conversations.convert_to_private_default_json_resp()}
  def convert_to_private(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin.Conversations, :convert_to_private},
      url: "/admin.conversations.convertToPrivate",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Admin.Conversations, :convert_to_private_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.Conversations, :convert_to_private_default_json_resp}
      ],
      opts: opts
    })
  end

  @type create_200_json_resp :: %{channel_id: String.t() | nil, ok: true}

  @type create_default_json_resp :: %{error: String.t(), ok: false}

  @doc """
  post `/admin.conversations.create`

  Create a public or private channel-based conversation.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.conversations.create)

  """
  @spec create(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Admin.Conversations.create_200_json_resp()}
          | {:error, SlackOpenApi.Web.Admin.Conversations.create_default_json_resp()}
  def create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin.Conversations, :create},
      url: "/admin.conversations.create",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Admin.Conversations, :create_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.Conversations, :create_default_json_resp}
      ],
      opts: opts
    })
  end

  @type delete_200_json_resp :: %{ok: true}

  @type delete_default_json_resp :: %{error: String.t(), ok: false}

  @doc """
  post `/admin.conversations.delete`

  Delete a public or private channel.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.conversations.delete)

  """
  @spec delete(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Admin.Conversations.delete_200_json_resp()}
          | {:error, SlackOpenApi.Web.Admin.Conversations.delete_default_json_resp()}
  def delete(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin.Conversations, :delete},
      url: "/admin.conversations.delete",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Admin.Conversations, :delete_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.Conversations, :delete_default_json_resp}
      ],
      opts: opts
    })
  end

  @type disconnect_shared_200_json_resp :: %{ok: true}

  @type disconnect_shared_default_json_resp :: %{error: String.t(), ok: false}

  @doc """
  post `/admin.conversations.disconnectShared`

  Disconnect a connected channel from one or more workspaces.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.conversations.disconnectShared)

  """
  @spec disconnect_shared(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Admin.Conversations.disconnect_shared_200_json_resp()}
          | {:error, SlackOpenApi.Web.Admin.Conversations.disconnect_shared_default_json_resp()}
  def disconnect_shared(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin.Conversations, :disconnect_shared},
      url: "/admin.conversations.disconnectShared",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Admin.Conversations, :disconnect_shared_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.Conversations, :disconnect_shared_default_json_resp}
      ],
      opts: opts
    })
  end

  @type get_conversation_prefs_200_json_resp :: %{
          ok: true,
          prefs:
            SlackOpenApi.Web.Admin.Conversations.get_conversation_prefs_200_json_resp_prefs()
            | nil
        }

  @type get_conversation_prefs_200_json_resp_prefs :: %{
          can_thread:
            SlackOpenApi.Web.Admin.Conversations.get_conversation_prefs_200_json_resp_prefs_can_thread()
            | nil,
          who_can_post:
            SlackOpenApi.Web.Admin.Conversations.get_conversation_prefs_200_json_resp_prefs_who_can_post()
            | nil
        }

  @type get_conversation_prefs_200_json_resp_prefs_can_thread :: %{
          type: [String.t()] | nil,
          user: [String.t()] | nil
        }

  @type get_conversation_prefs_200_json_resp_prefs_who_can_post :: %{
          type: [String.t()] | nil,
          user: [String.t()] | nil
        }

  @type get_conversation_prefs_default_json_resp :: %{error: String.t(), ok: false}

  @doc """
  get `/admin.conversations.getConversationPrefs`

  Get conversation preferences for a public or private channel.

  ## Options

    * `channel_id`: The channel to get preferences for.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.conversations.getConversationPrefs)

  """
  @spec get_conversation_prefs(opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Admin.Conversations.get_conversation_prefs_200_json_resp()}
          | {:error,
             SlackOpenApi.Web.Admin.Conversations.get_conversation_prefs_default_json_resp()}
  def get_conversation_prefs(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:channel_id])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Admin.Conversations, :get_conversation_prefs},
      url: "/admin.conversations.getConversationPrefs",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Admin.Conversations, :get_conversation_prefs_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.Conversations, :get_conversation_prefs_default_json_resp}
      ],
      opts: opts
    })
  end

  @type get_teams_200_json_resp :: %{
          ok: true,
          response_metadata:
            SlackOpenApi.Web.Admin.Conversations.get_teams_200_json_resp_response_metadata() | nil,
          team_ids: [String.t()]
        }

  @type get_teams_200_json_resp_response_metadata :: %{next_cursor: String.t()}

  @type get_teams_default_json_resp :: %{error: String.t(), ok: false}

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
  @spec get_teams(opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Admin.Conversations.get_teams_200_json_resp()}
          | {:error, SlackOpenApi.Web.Admin.Conversations.get_teams_default_json_resp()}
  def get_teams(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:channel_id, :cursor, :limit])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Admin.Conversations, :get_teams},
      url: "/admin.conversations.getTeams",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Admin.Conversations, :get_teams_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.Conversations, :get_teams_default_json_resp}
      ],
      opts: opts
    })
  end

  @type invite_200_json_resp :: %{ok: true}

  @type invite_default_json_resp :: %{error: String.t(), ok: false}

  @doc """
  post `/admin.conversations.invite`

  Invite a user to a public or private channel.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.conversations.invite)

  """
  @spec invite(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Admin.Conversations.invite_200_json_resp()}
          | {:error, SlackOpenApi.Web.Admin.Conversations.invite_default_json_resp()}
  def invite(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin.Conversations, :invite},
      url: "/admin.conversations.invite",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Admin.Conversations, :invite_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.Conversations, :invite_default_json_resp}
      ],
      opts: opts
    })
  end

  @type rename_200_json_resp :: %{ok: true}

  @type rename_default_json_resp :: %{error: String.t(), ok: false}

  @doc """
  post `/admin.conversations.rename`

  Rename a public or private channel.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.conversations.rename)

  """
  @spec rename(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Admin.Conversations.rename_200_json_resp()}
          | {:error, SlackOpenApi.Web.Admin.Conversations.rename_default_json_resp()}
  def rename(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin.Conversations, :rename},
      url: "/admin.conversations.rename",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Admin.Conversations, :rename_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.Conversations, :rename_default_json_resp}
      ],
      opts: opts
    })
  end

  @type search_200_json_resp :: %{
          channels: [SlackOpenApi.Web.ObjsChannel.t()],
          next_cursor: String.t()
        }

  @type search_default_json_resp :: %{error: String.t(), ok: false}

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
  @spec search(opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Admin.Conversations.search_200_json_resp()}
          | {:error, SlackOpenApi.Web.Admin.Conversations.search_default_json_resp()}
  def search(opts \\ []) do
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
      call: {SlackOpenApi.Web.Admin.Conversations, :search},
      url: "/admin.conversations.search",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Admin.Conversations, :search_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.Conversations, :search_default_json_resp}
      ],
      opts: opts
    })
  end

  @type set_conversation_prefs_200_json_resp :: %{ok: true}

  @type set_conversation_prefs_default_json_resp :: %{error: String.t(), ok: false}

  @doc """
  post `/admin.conversations.setConversationPrefs`

  Set the posting permissions for a public or private channel.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.conversations.setConversationPrefs)

  """
  @spec set_conversation_prefs(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Admin.Conversations.set_conversation_prefs_200_json_resp()}
          | {:error,
             SlackOpenApi.Web.Admin.Conversations.set_conversation_prefs_default_json_resp()}
  def set_conversation_prefs(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin.Conversations, :set_conversation_prefs},
      url: "/admin.conversations.setConversationPrefs",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Admin.Conversations, :set_conversation_prefs_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.Conversations, :set_conversation_prefs_default_json_resp}
      ],
      opts: opts
    })
  end

  @type set_teams_200_json_resp :: %{ok: true}

  @type set_teams_default_json_resp :: %{ok: false}

  @doc """
  post `/admin.conversations.setTeams`

  Set the workspaces in an Enterprise grid org that connect to a public or private channel.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.conversations.setTeams)

  """
  @spec set_teams(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Admin.Conversations.set_teams_200_json_resp()}
          | {:error, SlackOpenApi.Web.Admin.Conversations.set_teams_default_json_resp()}
  def set_teams(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin.Conversations, :set_teams},
      url: "/admin.conversations.setTeams",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Admin.Conversations, :set_teams_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.Conversations, :set_teams_default_json_resp}
      ],
      opts: opts
    })
  end

  @type unarchive_200_json_resp :: %{ok: true}

  @type unarchive_default_json_resp :: %{error: String.t(), ok: false}

  @doc """
  post `/admin.conversations.unarchive`

  Unarchive a public or private channel.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.conversations.unarchive)

  """
  @spec unarchive(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Admin.Conversations.unarchive_200_json_resp()}
          | {:error, SlackOpenApi.Web.Admin.Conversations.unarchive_default_json_resp()}
  def unarchive(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin.Conversations, :unarchive},
      url: "/admin.conversations.unarchive",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Admin.Conversations, :unarchive_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.Conversations, :unarchive_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:archive_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:archive_default_json_resp) do
    [
      error:
        {:enum,
         [
           "feature_not_enabled",
           "channel_not_found",
           "channel_type_not_supported",
           "default_org_wide_channel",
           "already_archived",
           "cant_archive_general",
           "restricted_action",
           "could_not_archive_channel"
         ]},
      ok: {:const, false}
    ]
  end

  def __fields__(:convert_to_private_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:convert_to_private_default_json_resp) do
    [
      error:
        {:enum,
         [
           "feature_not_enabled",
           "restricted_action",
           "name_taken",
           "channel_not_found",
           "channel_type_not_supported",
           "default_org_wide_channel",
           "method_not_supported_for_channel_type",
           "could_not_convert_channel",
           "external_channel_migrating"
         ]},
      ok: {:const, false}
    ]
  end

  def __fields__(:create_200_json_resp) do
    [channel_id: {:string, :generic}, ok: {:const, true}]
  end

  def __fields__(:create_default_json_resp) do
    [
      error:
        {:enum,
         [
           "feature_not_enabled",
           "name_taken",
           "restricted_action",
           "team_not_found",
           "invalid_team",
           "invalid_name",
           "could_not_create_channel",
           "team_id_or_org_required"
         ]},
      ok: {:const, false}
    ]
  end

  def __fields__(:delete_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:delete_default_json_resp) do
    [
      error:
        {:enum,
         [
           "feature_not_enabled",
           "not_an_admin",
           "channel_not_found",
           "channel_type_not_supported",
           "default_org_wide_channel",
           "restricted_action",
           "could_not_delete_channel",
           "missing_scope"
         ]},
      ok: {:const, false}
    ]
  end

  def __fields__(:disconnect_shared_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:disconnect_shared_default_json_resp) do
    [
      error:
        {:enum,
         [
           "feature_not_enabled",
           "not_an_admin",
           "not_an_enterprise",
           "channel_not_found",
           "not_supported",
           "team_not_found",
           "restricted_action",
           "missing_scope",
           "leaving_team_not_in_channel",
           "no_teams_to_disconnect",
           "leaving_team_required",
           "cannot_kick_team",
           "cannot_kick_home_team"
         ]},
      ok: {:const, false}
    ]
  end

  def __fields__(:get_conversation_prefs_200_json_resp) do
    [
      ok: {:const, true},
      prefs: {SlackOpenApi.Web.Admin.Conversations, :get_conversation_prefs_200_json_resp_prefs}
    ]
  end

  def __fields__(:get_conversation_prefs_200_json_resp_prefs) do
    [
      can_thread:
        {SlackOpenApi.Web.Admin.Conversations,
         :get_conversation_prefs_200_json_resp_prefs_can_thread},
      who_can_post:
        {SlackOpenApi.Web.Admin.Conversations,
         :get_conversation_prefs_200_json_resp_prefs_who_can_post}
    ]
  end

  def __fields__(:get_conversation_prefs_200_json_resp_prefs_can_thread) do
    [type: [string: :generic], user: [string: :generic]]
  end

  def __fields__(:get_conversation_prefs_200_json_resp_prefs_who_can_post) do
    [type: [string: :generic], user: [string: :generic]]
  end

  def __fields__(:get_conversation_prefs_default_json_resp) do
    [
      error:
        {:enum,
         [
           "feature_not_enabled",
           "not_an_admin",
           "not_an_enterprise",
           "restricted_action",
           "missing_scope",
           "channel_not_found",
           "channel_type_not_supported",
           "could_not_get_conversation_prefs"
         ]},
      ok: {:const, false}
    ]
  end

  def __fields__(:get_teams_200_json_resp) do
    [
      ok: {:const, true},
      response_metadata:
        {SlackOpenApi.Web.Admin.Conversations, :get_teams_200_json_resp_response_metadata},
      team_ids: [string: :generic]
    ]
  end

  def __fields__(:get_teams_200_json_resp_response_metadata) do
    [next_cursor: {:string, :generic}]
  end

  def __fields__(:get_teams_default_json_resp) do
    [
      error:
        {:enum,
         [
           "feature_not_enabled",
           "channel_not_found",
           "channel_type_not_supported",
           "unsupported_team_type",
           "restricted_action",
           "could_not_get_teams",
           "invalid_cursor",
           "invalid_limit"
         ]},
      ok: {:const, false}
    ]
  end

  def __fields__(:invite_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:invite_default_json_resp) do
    [
      error:
        {:enum,
         [
           "feature_not_enabled",
           "channel_not_found",
           "channel_type_not_supported",
           "default_org_wide_channel",
           "restricted_action",
           "user_must_be_admin",
           "failed_for_some_users"
         ]},
      ok: {:const, false}
    ]
  end

  def __fields__(:rename_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:rename_default_json_resp) do
    [
      error:
        {:enum,
         [
           "feature_not_enabled",
           "channel_not_found",
           "channel_type_not_supported",
           "restricted_action",
           "could_not_rename_channel",
           "default_org_wide_channel",
           "name_taken"
         ]},
      ok: {:const, false}
    ]
  end

  def __fields__(:search_200_json_resp) do
    [channels: [{SlackOpenApi.Web.ObjsChannel, :t}], next_cursor: {:string, :generic}]
  end

  def __fields__(:search_default_json_resp) do
    [
      error:
        {:enum,
         [
           "feature_not_enabled",
           "not_an_admin",
           "not_an_enterprise",
           "team_not_found",
           "not_allowed",
           "invalid_auth",
           "invalid_cursor",
           "invalid_search_channel_type",
           "invalid_sort",
           "invalid_sort_dir"
         ]},
      ok: {:const, false}
    ]
  end

  def __fields__(:set_conversation_prefs_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:set_conversation_prefs_default_json_resp) do
    [
      error:
        {:enum,
         [
           "feature_not_enabled",
           "not_an_admin",
           "channel_not_found",
           "channel_type_not_supported",
           "restricted_action",
           "missing_scope",
           "could_not_set_channel_pref",
           "default_org_wide_channel"
         ]},
      ok: {:const, false}
    ]
  end

  def __fields__(:set_teams_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:set_teams_default_json_resp) do
    [ok: {:const, false}]
  end

  def __fields__(:unarchive_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:unarchive_default_json_resp) do
    [
      error:
        {:enum,
         [
           "feature_not_enabled",
           "channel_not_found",
           "channel_not_archived",
           "channel_type_not_supported",
           "restricted_action",
           "could_not_unarchive_channel",
           "default_org_wide_channel",
           "missing_scope"
         ]},
      ok: {:const, false}
    ]
  end
end
