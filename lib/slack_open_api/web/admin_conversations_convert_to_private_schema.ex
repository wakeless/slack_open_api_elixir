defmodule SlackOpenApi.Web.AdminConversationsConvertToPrivateSchema do
  @moduledoc """
  Provides struct and type for a AdminConversationsConvertToPrivateSchema
  """

  @type t :: %__MODULE__{ok: true}

  defstruct [:ok]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [ok: {:const, true}]
  end
end
