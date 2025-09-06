defmodule SlackOpenApi.Web.AppsPermissionsInfoSchemaInfoChannel do
  @moduledoc """
  Provides struct and type for a AppsPermissionsInfoSchemaInfoChannel
  """

  @type t :: %__MODULE__{
          resources: SlackOpenApi.Web.ObjsResources.t() | nil,
          scopes: [String.t()] | nil
        }

  defstruct [:resources, :scopes]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [resources: {SlackOpenApi.Web.ObjsResources, :t}, scopes: [string: :generic]]
  end
end
