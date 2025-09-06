defmodule SlackOpenApi.Web.AdminConversationsSetConversationPrefsErrorSchema do
  @moduledoc """
  Provides struct and type for a AdminConversationsSetConversationPrefsErrorSchema
  """

  @type t :: %__MODULE__{error: String.t(), ok: false}

  defstruct [:error, :ok]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      error:
        {:enum,
         [
           "feature_not_enabled",
           "not_an_admin",
           "channel_not_found",
           "channel_type_not_supported",
           "restricted_action",
           "missing_scope",
           "could_not_set_channel_pref",
           "default_org_wide_channel"
         ]},
      ok: {:const, false}
    ]
  end
end
