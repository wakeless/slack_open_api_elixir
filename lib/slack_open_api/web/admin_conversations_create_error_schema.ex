defmodule SlackOpenApi.Web.AdminConversationsCreateErrorSchema do
  @moduledoc """
  Provides struct and type for a AdminConversationsCreateErrorSchema
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
           "name_taken",
           "restricted_action",
           "team_not_found",
           "invalid_team",
           "invalid_name",
           "could_not_create_channel",
           "team_id_or_org_required"
         ]},
      ok: {:const, false}
    ]
  end
end
