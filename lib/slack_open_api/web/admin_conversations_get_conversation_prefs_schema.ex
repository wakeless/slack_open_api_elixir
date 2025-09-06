defmodule SlackOpenApi.Web.AdminConversationsGetConversationPrefsSchema do
  @moduledoc """
  Provides struct and type for a AdminConversationsGetConversationPrefsSchema
  """

  @type t :: %__MODULE__{
          ok: true,
          prefs: SlackOpenApi.Web.AdminConversationsGetConversationPrefsSchemaPrefs.t() | nil
        }

  defstruct [:ok, :prefs]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      ok: {:const, true},
      prefs: {SlackOpenApi.Web.AdminConversationsGetConversationPrefsSchemaPrefs, :t}
    ]
  end
end
