defmodule SlackOpenApi.Web.AdminConversationsSearchErrorSchema do
  @moduledoc """
  Provides struct and type for a AdminConversationsSearchErrorSchema
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
           "team_not_found",
           "not_allowed",
           "invalid_auth",
           "invalid_cursor",
           "invalid_search_channel_type",
           "invalid_sort",
           "invalid_sort_dir"
         ]},
      ok: {:const, false}
    ]
  end
end
