defmodule SlackOpenApi.Web.ObjsSubteam do
  @moduledoc """
  Provides struct and type for a ObjsSubteam
  """

  @type t :: %__MODULE__{
          auto_provision: boolean,
          auto_type: map,
          channel_count: integer | nil,
          created_by: String.t(),
          date_create: integer,
          date_delete: integer,
          date_update: integer,
          deleted_by: map,
          description: String.t(),
          enterprise_subteam_id: String.t(),
          handle: String.t(),
          id: String.t(),
          is_external: boolean,
          is_subteam: boolean,
          is_usergroup: boolean,
          name: String.t(),
          prefs: SlackOpenApi.Web.ObjsSubteamPrefs.t(),
          team_id: String.t(),
          updated_by: String.t(),
          user_count: integer | nil,
          users: [String.t()] | nil
        }

  defstruct [
    :auto_provision,
    :auto_type,
    :channel_count,
    :created_by,
    :date_create,
    :date_delete,
    :date_update,
    :deleted_by,
    :description,
    :enterprise_subteam_id,
    :handle,
    :id,
    :is_external,
    :is_subteam,
    :is_usergroup,
    :name,
    :prefs,
    :team_id,
    :updated_by,
    :user_count,
    :users
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      auto_provision: :boolean,
      auto_type: :map,
      channel_count: :integer,
      created_by: {:string, :generic},
      date_create: :integer,
      date_delete: :integer,
      date_update: :integer,
      deleted_by: :map,
      description: {:string, :generic},
      enterprise_subteam_id: {:string, :generic},
      handle: {:string, :generic},
      id: {:string, :generic},
      is_external: :boolean,
      is_subteam: :boolean,
      is_usergroup: :boolean,
      name: {:string, :generic},
      prefs: {SlackOpenApi.Web.ObjsSubteamPrefs, :t},
      team_id: {:string, :generic},
      updated_by: {:string, :generic},
      user_count: :integer,
      users: [string: :generic]
    ]
  end
end
