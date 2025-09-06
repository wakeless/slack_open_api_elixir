defmodule SlackOpenApi.Web.ObjsExternalOrgMigrations do
  @moduledoc """
  Provides struct and type for a ObjsExternalOrgMigrations
  """

  @type t :: %__MODULE__{
          current: [SlackOpenApi.Web.ObjsExternalOrgMigrationsCurrent.t()],
          date_updated: integer
        }

  defstruct [:current, :date_updated]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [current: [{SlackOpenApi.Web.ObjsExternalOrgMigrationsCurrent, :t}], date_updated: :integer]
  end
end
