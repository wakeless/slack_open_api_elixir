defmodule SlackOpenApi.Web.AdminConversationsCreateSchema do
  @moduledoc """
  Provides struct and type for a AdminConversationsCreateSchema
  """

  @type t :: %__MODULE__{channel_id: String.t() | nil, ok: true}

  defstruct [:channel_id, :ok]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [channel_id: {:string, :generic}, ok: {:const, true}]
  end
end
