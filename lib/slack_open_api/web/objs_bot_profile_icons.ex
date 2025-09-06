defmodule SlackOpenApi.Web.ObjsBotProfileIcons do
  @moduledoc """
  Provides struct and type for a ObjsBotProfileIcons
  """

  @type t :: %__MODULE__{image_36: String.t(), image_48: String.t(), image_72: String.t()}

  defstruct [:image_36, :image_48, :image_72]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [image_36: {:string, :uri}, image_48: {:string, :uri}, image_72: {:string, :uri}]
  end
end
