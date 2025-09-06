defmodule SlackOpenApi.Web.AdminConversationsConvertToPrivateErrorSchema do
  @moduledoc """
  Provides struct and type for a AdminConversationsConvertToPrivateErrorSchema
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
           "restricted_action",
           "name_taken",
           "channel_not_found",
           "channel_type_not_supported",
           "default_org_wide_channel",
           "method_not_supported_for_channel_type",
           "could_not_convert_channel",
           "external_channel_migrating"
         ]},
      ok: {:const, false}
    ]
  end
end
