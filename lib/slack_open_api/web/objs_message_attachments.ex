defmodule SlackOpenApi.Web.ObjsMessageAttachments do
  @moduledoc """
  Provides struct and type for a ObjsMessageAttachments
  """

  @type t :: %__MODULE__{
          fallback: String.t() | nil,
          id: integer,
          image_bytes: integer | nil,
          image_height: integer | nil,
          image_url: String.t() | nil,
          image_width: integer | nil
        }

  defstruct [:fallback, :id, :image_bytes, :image_height, :image_url, :image_width]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      fallback: {:string, :generic},
      id: :integer,
      image_bytes: :integer,
      image_height: :integer,
      image_url: {:string, :generic},
      image_width: :integer
    ]
  end
end
