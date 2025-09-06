defmodule SlackOpenApi.Web.AppsPermissionsResourcesListSuccessSchemaResponseMetadata do
  @moduledoc """
  Provides struct and type for a AppsPermissionsResourcesListSuccessSchemaResponseMetadata
  """

  @type t :: %__MODULE__{next_cursor: String.t()}

  defstruct [:next_cursor]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [next_cursor: {:string, :generic}]
  end
end
