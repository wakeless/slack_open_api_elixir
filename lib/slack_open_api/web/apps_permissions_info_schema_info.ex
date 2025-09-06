defmodule SlackOpenApi.Web.AppsPermissionsInfoSchemaInfo do
  @moduledoc """
  Provides struct and type for a AppsPermissionsInfoSchemaInfo
  """

  @type t :: %__MODULE__{
          app_home: SlackOpenApi.Web.AppsPermissionsInfoSchemaInfoAppHome.t(),
          channel: SlackOpenApi.Web.AppsPermissionsInfoSchemaInfoChannel.t(),
          group: SlackOpenApi.Web.AppsPermissionsInfoSchemaInfoGroup.t(),
          im: SlackOpenApi.Web.AppsPermissionsInfoSchemaInfoIm.t(),
          mpim: SlackOpenApi.Web.AppsPermissionsInfoSchemaInfoMpim.t(),
          team: SlackOpenApi.Web.AppsPermissionsInfoSchemaInfoTeam.t()
        }

  defstruct [:app_home, :channel, :group, :im, :mpim, :team]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      app_home: {SlackOpenApi.Web.AppsPermissionsInfoSchemaInfoAppHome, :t},
      channel: {SlackOpenApi.Web.AppsPermissionsInfoSchemaInfoChannel, :t},
      group: {SlackOpenApi.Web.AppsPermissionsInfoSchemaInfoGroup, :t},
      im: {SlackOpenApi.Web.AppsPermissionsInfoSchemaInfoIm, :t},
      mpim: {SlackOpenApi.Web.AppsPermissionsInfoSchemaInfoMpim, :t},
      team: {SlackOpenApi.Web.AppsPermissionsInfoSchemaInfoTeam, :t}
    ]
  end
end
