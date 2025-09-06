defmodule SlackOpenApi.Web.MessageObject do
  @moduledoc """
  Provides struct and type for a MessageObject
  """

  @type t :: %__MODULE__{attachments: [map] | nil, blocks: map | nil, text: String.t()}

  defstruct [:attachments, :blocks, :text]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [attachments: [:map], blocks: :map, text: {:string, :generic}]
  end
end
