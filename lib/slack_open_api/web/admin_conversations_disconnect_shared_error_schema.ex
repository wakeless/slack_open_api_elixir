defmodule SlackOpenApi.Web.AdminConversationsDisconnectSharedErrorSchema do
  @moduledoc """
  Provides struct and type for a AdminConversationsDisconnectSharedErrorSchema
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
           "not_an_enterprise",
           "channel_not_found",
           "not_supported",
           "team_not_found",
           "restricted_action",
           "missing_scope",
           "leaving_team_not_in_channel",
           "no_teams_to_disconnect",
           "leaving_team_required",
           "cannot_kick_team",
           "cannot_kick_home_team"
         ]},
      ok: {:const, false}
    ]
  end
end
