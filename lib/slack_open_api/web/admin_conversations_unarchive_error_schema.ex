defmodule SlackOpenApi.Web.AdminConversationsUnarchiveErrorSchema do
  @moduledoc """
  Provides struct and types for a AdminConversationsUnarchiveErrorSchema
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
           "channel_not_archived",
           "channel_not_found",
           "channel_not_found",
           "channel_not_found",
           "channel_type_not_supported",
           "channel_type_not_supported",
           "channel_type_not_supported",
           "could_not_get_conversation_prefs",
           "could_not_rename_channel",
           "could_not_unarchive_channel",
           "default_org_wide_channel",
           "default_org_wide_channel",
           "feature_not_enabled",
           "feature_not_enabled",
           "feature_not_enabled",
           "missing_scope",
           "missing_scope",
           "name_taken",
           "not_an_admin",
           "not_an_enterprise",
           "restricted_action",
           "restricted_action",
           "restricted_action"
         ]},
      ok: {:const, false}
    ]
  end
end
