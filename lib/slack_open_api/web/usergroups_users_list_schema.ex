defmodule SlackOpenApi.Web.UsergroupsUsersListSchema do
  @moduledoc """
  Provides struct and type for a UsergroupsUsersListSchema
  """

  @type t :: %__MODULE__{ok: true, users: [String.t()]}

  defstruct [:ok, :users]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [ok: {:const, true}, users: [string: :generic]]
  end
end
