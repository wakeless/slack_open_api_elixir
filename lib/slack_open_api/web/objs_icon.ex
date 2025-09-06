defmodule SlackOpenApi.Web.ObjsIcon do
  @moduledoc """
  Provides struct and type for a ObjsIcon
  """

  @type t :: %__MODULE__{
          image_102: String.t() | nil,
          image_132: String.t() | nil,
          image_230: String.t() | nil,
          image_34: String.t() | nil,
          image_44: String.t() | nil,
          image_68: String.t() | nil,
          image_88: String.t() | nil,
          image_default: boolean | nil
        }

  defstruct [
    :image_102,
    :image_132,
    :image_230,
    :image_34,
    :image_44,
    :image_68,
    :image_88,
    :image_default
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      image_102: {:string, :generic},
      image_132: {:string, :generic},
      image_230: {:string, :generic},
      image_34: {:string, :generic},
      image_44: {:string, :generic},
      image_68: {:string, :generic},
      image_88: {:string, :generic},
      image_default: :boolean
    ]
  end
end
