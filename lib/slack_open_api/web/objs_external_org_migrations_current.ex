defmodule SlackOpenApi.Web.ObjsExternalOrgMigrationsCurrent do
  @moduledoc """
  Provides struct and type for a ObjsExternalOrgMigrationsCurrent
  """

  @type t :: %__MODULE__{date_started: integer, team_id: String.t()}

  defstruct [:date_started, :team_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [date_started: :integer, team_id: {:string, :generic}]
  end
end
