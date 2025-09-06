defmodule SlackOpenApi.Web.ObjsPrimaryOwner do
  @moduledoc """
  Provides struct and type for a ObjsPrimaryOwner
  """

  @type t :: %__MODULE__{email: String.t(), id: String.t()}

  defstruct [:email, :id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [email: {:string, :generic}, id: {:string, :generic}]
  end
end
