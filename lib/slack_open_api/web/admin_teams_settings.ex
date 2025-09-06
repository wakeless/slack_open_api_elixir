defmodule SlackOpenApi.Web.AdminTeamsSettings do
  @moduledoc """
  Provides API endpoints related to admin teams settings
  """

  @default_client SlackOpenApi.Client

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
      call: {SlackOpenApi.Web.AdminTeamsSettings, :admin_teams_settings_info},
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
      call: {SlackOpenApi.Web.AdminTeamsSettings, :admin_teams_settings_set_default_channels},
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
      call: {SlackOpenApi.Web.AdminTeamsSettings, :admin_teams_settings_set_description},
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
      call: {SlackOpenApi.Web.AdminTeamsSettings, :admin_teams_settings_set_discoverability},
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
      call: {SlackOpenApi.Web.AdminTeamsSettings, :admin_teams_settings_set_icon},
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
      call: {SlackOpenApi.Web.AdminTeamsSettings, :admin_teams_settings_set_name},
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
end
