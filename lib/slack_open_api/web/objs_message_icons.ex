defmodule SlackOpenApi.Web.ObjsMessageIcons do
  @moduledoc """
  Provides struct and type for a ObjsMessageIcons
  """

  @type t :: %__MODULE__{emoji: String.t() | nil, image_64: String.t() | nil}

  defstruct [:emoji, :image_64]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [emoji: {:string, :generic}, image_64: {:string, :uri}]
  end
end
