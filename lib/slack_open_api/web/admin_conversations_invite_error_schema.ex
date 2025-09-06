defmodule SlackOpenApi.Web.AdminConversationsInviteErrorSchema do
  @moduledoc """
  Provides struct and type for a AdminConversationsInviteErrorSchema
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
           "channel_not_found",
           "channel_type_not_supported",
           "default_org_wide_channel",
           "restricted_action",
           "user_must_be_admin",
           "failed_for_some_users"
         ]},
      ok: {:const, false}
    ]
  end
end
