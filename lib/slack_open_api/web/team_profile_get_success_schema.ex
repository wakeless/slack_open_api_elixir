defmodule SlackOpenApi.Web.TeamProfileGetSuccessSchema do
  @moduledoc """
  Provides struct and type for a TeamProfileGetSuccessSchema
  """

  @type t :: %__MODULE__{
          ok: true,
          profile: SlackOpenApi.Web.TeamProfileGetSuccessSchemaProfile.t()
        }

  defstruct [:ok, :profile]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [ok: {:const, true}, profile: {SlackOpenApi.Web.TeamProfileGetSuccessSchemaProfile, :t}]
  end
end
