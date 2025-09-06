defmodule SlackOpenApi.Web.UsergroupsUsersUpdateSchema do
  @moduledoc """
  Provides struct and type for a UsergroupsUsersUpdateSchema
  """

  @type t :: %__MODULE__{ok: true, usergroup: SlackOpenApi.Web.ObjsSubteam.t()}

  defstruct [:ok, :usergroup]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [ok: {:const, true}, usergroup: {SlackOpenApi.Web.ObjsSubteam, :t}]
  end
end
