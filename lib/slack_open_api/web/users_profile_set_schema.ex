defmodule SlackOpenApi.Web.UsersProfileSetSchema do
  @moduledoc """
  Provides struct and type for a UsersProfileSetSchema
  """

  @type t :: %__MODULE__{
          email_pending: String.t() | nil,
          ok: true,
          profile: SlackOpenApi.Web.ObjsUserProfile.t(),
          username: String.t()
        }

  defstruct [:email_pending, :ok, :profile, :username]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      email_pending: {:string, :email},
      ok: {:const, true},
      profile: {SlackOpenApi.Web.ObjsUserProfile, :t},
      username: {:string, :generic}
    ]
  end
end
