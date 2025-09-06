defmodule SlackOpenApi.Web.ObjsSubteamPrefs do
  @moduledoc """
  Provides struct and type for a ObjsSubteamPrefs
  """

  @type t :: %__MODULE__{channels: [String.t()], groups: [String.t()]}

  defstruct [:channels, :groups]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [channels: [string: :generic], groups: [string: :generic]]
  end
end
