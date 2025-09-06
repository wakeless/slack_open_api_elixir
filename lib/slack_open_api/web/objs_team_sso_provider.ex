defmodule SlackOpenApi.Web.ObjsTeamSsoProvider do
  @moduledoc """
  Provides struct and type for a ObjsTeamSsoProvider
  """

  @type t :: %__MODULE__{label: String.t() | nil, name: String.t() | nil, type: String.t() | nil}

  defstruct [:label, :name, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [label: {:string, :generic}, name: {:string, :generic}, type: {:string, :generic}]
  end
end
