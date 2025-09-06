defmodule SlackOpenApi.Web.AdminConversationsSearchSchema do
  @moduledoc """
  Provides struct and type for a AdminConversationsSearchSchema
  """

  @type t :: %__MODULE__{channels: [SlackOpenApi.Web.ObjsChannel.t()], next_cursor: String.t()}

  defstruct [:channels, :next_cursor]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [channels: [{SlackOpenApi.Web.ObjsChannel, :t}], next_cursor: {:string, :generic}]
  end
end
