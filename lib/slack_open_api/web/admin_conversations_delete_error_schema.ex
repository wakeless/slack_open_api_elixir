defmodule SlackOpenApi.Web.AdminConversationsDeleteErrorSchema do
  @moduledoc """
  Provides struct and type for a AdminConversationsDeleteErrorSchema
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
           "default_org_wide_channel",
           "restricted_action",
           "could_not_delete_channel",
           "missing_scope"
         ]},
      ok: {:const, false}
    ]
  end
end
