defmodule SlackOpenApi.Web.UsersProfileGetSchema do
  @moduledoc """
  Provides struct and type for a UsersProfileGetSchema
  """

  @type t :: %__MODULE__{ok: true, profile: SlackOpenApi.Web.ObjsUserProfile.t()}

  defstruct [:ok, :profile]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [ok: {:const, true}, profile: {SlackOpenApi.Web.ObjsUserProfile, :t}]
  end
end
