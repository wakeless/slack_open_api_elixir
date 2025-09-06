defmodule SlackOpenApi.Web.AppsPermissionsResourcesListSuccessSchemaResources do
  @moduledoc """
  Provides struct and type for a AppsPermissionsResourcesListSuccessSchemaResources
  """

  @type t :: %__MODULE__{id: String.t() | nil, type: String.t() | nil}

  defstruct [:id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [id: {:string, :generic}, type: {:string, :generic}]
  end
end
