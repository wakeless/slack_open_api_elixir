defmodule SlackOpenApi.Web.ObjsUserProfileShort do
  @moduledoc """
  Provides struct and type for a ObjsUserProfileShort
  """

  @type t :: %__MODULE__{
          avatar_hash: String.t(),
          display_name: String.t(),
          display_name_normalized: String.t() | nil,
          first_name: String.t() | nil,
          image_72: String.t(),
          is_restricted: boolean,
          is_ultra_restricted: boolean,
          name: String.t(),
          real_name: String.t(),
          real_name_normalized: String.t() | nil,
          team: String.t()
        }

  defstruct [
    :avatar_hash,
    :display_name,
    :display_name_normalized,
    :first_name,
    :image_72,
    :is_restricted,
    :is_ultra_restricted,
    :name,
    :real_name,
    :real_name_normalized,
    :team
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      avatar_hash: {:string, :generic},
      display_name: {:string, :generic},
      display_name_normalized: {:string, :generic},
      first_name: {:string, :generic},
      image_72: {:string, :uri},
      is_restricted: :boolean,
      is_ultra_restricted: :boolean,
      name: {:string, :generic},
      real_name: {:string, :generic},
      real_name_normalized: {:string, :generic},
      team: {:string, :generic}
    ]
  end
end
