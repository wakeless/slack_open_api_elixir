defmodule SlackOpenApi.Web.ObjsReaction do
  @moduledoc """
  Provides struct and type for a ObjsReaction
  """

  @type t :: %__MODULE__{count: integer, name: String.t(), users: [String.t()]}

  defstruct [:count, :name, :users]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [count: :integer, name: {:string, :generic}, users: [string: :generic]]
  end
end
