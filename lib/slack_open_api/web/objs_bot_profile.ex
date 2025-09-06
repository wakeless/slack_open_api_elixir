defmodule SlackOpenApi.Web.ObjsBotProfile do
  @moduledoc """
  Provides struct and type for a ObjsBotProfile
  """

  @type t :: %__MODULE__{
          app_id: String.t(),
          deleted: boolean,
          icons: SlackOpenApi.Web.ObjsBotProfileIcons.t(),
          id: String.t(),
          name: String.t(),
          team_id: String.t(),
          updated: integer
        }

  defstruct [:app_id, :deleted, :icons, :id, :name, :team_id, :updated]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      app_id: {:string, :generic},
      deleted: :boolean,
      icons: {SlackOpenApi.Web.ObjsBotProfileIcons, :t},
      id: {:string, :generic},
      name: {:string, :generic},
      team_id: {:string, :generic},
      updated: :integer
    ]
  end
end
