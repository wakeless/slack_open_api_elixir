defmodule SlackOpenApi.Web.ChatScheduledMessagesListSchema do
  @moduledoc """
  Provides struct and type for a ChatScheduledMessagesListSchema
  """

  @type t :: %__MODULE__{
          ok: true,
          response_metadata: SlackOpenApi.Web.ChatScheduledMessagesListSchemaResponseMetadata.t(),
          scheduled_messages: [
            SlackOpenApi.Web.ChatScheduledMessagesListSchemaScheduledMessages.t()
          ]
        }

  defstruct [:ok, :response_metadata, :scheduled_messages]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      ok: {:const, true},
      response_metadata: {SlackOpenApi.Web.ChatScheduledMessagesListSchemaResponseMetadata, :t},
      scheduled_messages: [
        {SlackOpenApi.Web.ChatScheduledMessagesListSchemaScheduledMessages, :t}
      ]
    ]
  end
end
