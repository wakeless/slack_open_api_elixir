defmodule SlackOpenApi.Web.AppsPermissionsResourcesListSuccessSchema do
  @moduledoc """
  Provides struct and type for a AppsPermissionsResourcesListSuccessSchema
  """

  @type t :: %__MODULE__{
          ok: true,
          resources: [SlackOpenApi.Web.AppsPermissionsResourcesListSuccessSchemaResources.t()],
          response_metadata:
            SlackOpenApi.Web.AppsPermissionsResourcesListSuccessSchemaResponseMetadata.t() | nil
        }

  defstruct [:ok, :resources, :response_metadata]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      ok: {:const, true},
      resources: [{SlackOpenApi.Web.AppsPermissionsResourcesListSuccessSchemaResources, :t}],
      response_metadata:
        {SlackOpenApi.Web.AppsPermissionsResourcesListSuccessSchemaResponseMetadata, :t}
    ]
  end
end
