defmodule SlackOpenApi.Web.AppsPermissionsInfoSchema do
  @moduledoc """
  Provides struct and type for a AppsPermissionsInfoSchema
  """

  @type t :: %__MODULE__{info: SlackOpenApi.Web.AppsPermissionsInfoSchemaInfo.t(), ok: true}

  defstruct [:info, :ok]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [info: {SlackOpenApi.Web.AppsPermissionsInfoSchemaInfo, :t}, ok: {:const, true}]
  end
end
