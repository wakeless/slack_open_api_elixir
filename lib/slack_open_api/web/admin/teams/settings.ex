defmodule SlackOpenApi.Web.Admin.Teams.Settings do
  @moduledoc """
  Provides API endpoints related to admin/teams/settings
  """

  @default_client SlackOpenApi.Client

  @type info_200_json_resp :: %{ok: true}

  @type info_default_json_resp :: %{ok: false}

  @doc """
  get `/admin.teams.settings.info`

  Fetch information about settings in a workspace

  ## Options

    * `team_id`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.teams.settings.info)

  """
  @spec info(opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Admin.Teams.Settings.info_200_json_resp()}
          | {:error, SlackOpenApi.Web.Admin.Teams.Settings.info_default_json_resp()}
  def info(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:team_id])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Admin.Teams.Settings, :info},
      url: "/admin.teams.settings.info",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Admin.Teams.Settings, :info_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.Teams.Settings, :info_default_json_resp}
      ],
      opts: opts
    })
  end

  @type set_default_channels_200_json_resp :: %{ok: true}

  @type set_default_channels_default_json_resp :: %{ok: false}

  @doc """
  post `/admin.teams.settings.setDefaultChannels`

  Set the default channels of a workspace.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.teams.settings.setDefaultChannels)

  """
  @spec set_default_channels(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Admin.Teams.Settings.set_default_channels_200_json_resp()}
          | {:error,
             SlackOpenApi.Web.Admin.Teams.Settings.set_default_channels_default_json_resp()}
  def set_default_channels(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin.Teams.Settings, :set_default_channels},
      url: "/admin.teams.settings.setDefaultChannels",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Admin.Teams.Settings, :set_default_channels_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.Teams.Settings, :set_default_channels_default_json_resp}
      ],
      opts: opts
    })
  end

  @type set_description_200_json_resp :: %{ok: true}

  @type set_description_default_json_resp :: %{ok: false}

  @doc """
  post `/admin.teams.settings.setDescription`

  Set the description of a given workspace.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.teams.settings.setDescription)

  """
  @spec set_description(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Admin.Teams.Settings.set_description_200_json_resp()}
          | {:error, SlackOpenApi.Web.Admin.Teams.Settings.set_description_default_json_resp()}
  def set_description(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin.Teams.Settings, :set_description},
      url: "/admin.teams.settings.setDescription",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Admin.Teams.Settings, :set_description_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.Teams.Settings, :set_description_default_json_resp}
      ],
      opts: opts
    })
  end

  @type set_discoverability_200_json_resp :: %{ok: true}

  @type set_discoverability_default_json_resp :: %{ok: false}

  @doc """
  post `/admin.teams.settings.setDiscoverability`

  An API method that allows admins to set the discoverability of a given workspace

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.teams.settings.setDiscoverability)

  """
  @spec set_discoverability(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Admin.Teams.Settings.set_discoverability_200_json_resp()}
          | {:error,
             SlackOpenApi.Web.Admin.Teams.Settings.set_discoverability_default_json_resp()}
  def set_discoverability(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin.Teams.Settings, :set_discoverability},
      url: "/admin.teams.settings.setDiscoverability",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Admin.Teams.Settings, :set_discoverability_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.Teams.Settings, :set_discoverability_default_json_resp}
      ],
      opts: opts
    })
  end

  @type set_icon_200_json_resp :: %{ok: true}

  @type set_icon_default_json_resp :: %{ok: false}

  @doc """
  post `/admin.teams.settings.setIcon`

  Sets the icon of a workspace.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.teams.settings.setIcon)

  """
  @spec set_icon(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Admin.Teams.Settings.set_icon_200_json_resp()}
          | {:error, SlackOpenApi.Web.Admin.Teams.Settings.set_icon_default_json_resp()}
  def set_icon(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin.Teams.Settings, :set_icon},
      url: "/admin.teams.settings.setIcon",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Admin.Teams.Settings, :set_icon_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.Teams.Settings, :set_icon_default_json_resp}
      ],
      opts: opts
    })
  end

  @type set_name_200_json_resp :: %{ok: true}

  @type set_name_default_json_resp :: %{ok: false}

  @doc """
  post `/admin.teams.settings.setName`

  Set the name of a given workspace.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.teams.settings.setName)

  """
  @spec set_name(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Admin.Teams.Settings.set_name_200_json_resp()}
          | {:error, SlackOpenApi.Web.Admin.Teams.Settings.set_name_default_json_resp()}
  def set_name(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin.Teams.Settings, :set_name},
      url: "/admin.teams.settings.setName",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Admin.Teams.Settings, :set_name_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.Teams.Settings, :set_name_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:info_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:info_default_json_resp) do
    [ok: {:const, false}]
  end

  def __fields__(:set_default_channels_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:set_default_channels_default_json_resp) do
    [ok: {:const, false}]
  end

  def __fields__(:set_description_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:set_description_default_json_resp) do
    [ok: {:const, false}]
  end

  def __fields__(:set_discoverability_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:set_discoverability_default_json_resp) do
    [ok: {:const, false}]
  end

  def __fields__(:set_icon_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:set_icon_default_json_resp) do
    [ok: {:const, false}]
  end

  def __fields__(:set_name_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:set_name_default_json_resp) do
    [ok: {:const, false}]
  end
end
