defmodule SlackOpenApi.Web.ObjsChannelPurpose do
  @moduledoc """
  Provides struct and type for a ObjsChannelPurpose
  """

  @type t :: %__MODULE__{creator: String.t(), last_set: integer, value: String.t()}

  defstruct [:creator, :last_set, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [creator: {:string, :generic}, last_set: :integer, value: {:string, :generic}]
  end
end
