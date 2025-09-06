defmodule SlackOpenApi.Web.ApiPermissionsScopesListSuccessSchema do
  @moduledoc """
  Provides struct and type for a ApiPermissionsScopesListSuccessSchema
  """

  @type t :: %__MODULE__{
          ok: true,
          scopes: SlackOpenApi.Web.ApiPermissionsScopesListSuccessSchemaScopes.t()
        }

  defstruct [:ok, :scopes]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      ok: {:const, true},
      scopes: {SlackOpenApi.Web.ApiPermissionsScopesListSuccessSchemaScopes, :t}
    ]
  end
end
