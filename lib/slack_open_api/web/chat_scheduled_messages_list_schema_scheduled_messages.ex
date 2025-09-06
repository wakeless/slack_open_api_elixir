defmodule SlackOpenApi.Web.ChatScheduledMessagesListSchemaScheduledMessages do
  @moduledoc """
  Provides struct and type for a ChatScheduledMessagesListSchemaScheduledMessages
  """

  @type t :: %__MODULE__{
          channel_id: String.t(),
          date_created: integer,
          id: String.t(),
          post_at: integer,
          text: String.t() | nil
        }

  defstruct [:channel_id, :date_created, :id, :post_at, :text]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      channel_id: {:string, :generic},
      date_created: :integer,
      id: {:string, :generic},
      post_at: :integer,
      text: {:string, :generic}
    ]
  end
end
