defmodule SlackOpenApi.Web.AdminConversationsGetConversationPrefsSchemaPrefs do
  @moduledoc """
  Provides struct and type for a AdminConversationsGetConversationPrefsSchemaPrefs
  """

  @type t :: %__MODULE__{
          can_thread:
            SlackOpenApi.Web.AdminConversationsGetConversationPrefsSchemaPrefsCanThread.t() | nil,
          who_can_post:
            SlackOpenApi.Web.AdminConversationsGetConversationPrefsSchemaPrefsWhoCanPost.t() | nil
        }

  defstruct [:can_thread, :who_can_post]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      can_thread:
        {SlackOpenApi.Web.AdminConversationsGetConversationPrefsSchemaPrefsCanThread, :t},
      who_can_post:
        {SlackOpenApi.Web.AdminConversationsGetConversationPrefsSchemaPrefsWhoCanPost, :t}
    ]
  end
end
