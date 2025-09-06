defmodule SlackOpenApi.Web.AdminConversationsGetConversationPrefsSchemaPrefsWhoCanPost do
  @moduledoc """
  Provides struct and type for a AdminConversationsGetConversationPrefsSchemaPrefsWhoCanPost
  """

  @type t :: %__MODULE__{type: [String.t()] | nil, user: [String.t()] | nil}

  defstruct [:type, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [type: [string: :generic], user: [string: :generic]]
  end
end
