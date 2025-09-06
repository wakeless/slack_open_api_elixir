defmodule SlackOpenApi.Web.ObjsTeam do
  @moduledoc """
  Provides struct and type for a ObjsTeam
  """

  @type t :: %__MODULE__{
          archived: boolean | nil,
          avatar_base_url: String.t() | nil,
          created: integer | nil,
          date_create: integer | nil,
          deleted: boolean | nil,
          description: String.t() | nil,
          discoverable: map | nil,
          domain: String.t(),
          email_domain: String.t(),
          enterprise_id: String.t() | nil,
          enterprise_name: String.t() | nil,
          external_org_migrations: SlackOpenApi.Web.ObjsExternalOrgMigrations.t() | nil,
          has_compliance_export: boolean | nil,
          icon: SlackOpenApi.Web.ObjsIcon.t(),
          id: String.t(),
          is_assigned: boolean | nil,
          is_enterprise: integer | nil,
          is_over_storage_limit: boolean | nil,
          limit_ts: integer | nil,
          locale: String.t() | nil,
          messages_count: integer | nil,
          msg_edit_window_mins: integer | nil,
          name: String.t(),
          over_integrations_limit: boolean | nil,
          over_storage_limit: boolean | nil,
          pay_prod_cur: String.t() | nil,
          plan: String.t() | nil,
          primary_owner: SlackOpenApi.Web.ObjsPrimaryOwner.t() | nil,
          sso_provider: SlackOpenApi.Web.ObjsTeamSsoProvider.t() | nil
        }

  defstruct [
    :archived,
    :avatar_base_url,
    :created,
    :date_create,
    :deleted,
    :description,
    :discoverable,
    :domain,
    :email_domain,
    :enterprise_id,
    :enterprise_name,
    :external_org_migrations,
    :has_compliance_export,
    :icon,
    :id,
    :is_assigned,
    :is_enterprise,
    :is_over_storage_limit,
    :limit_ts,
    :locale,
    :messages_count,
    :msg_edit_window_mins,
    :name,
    :over_integrations_limit,
    :over_storage_limit,
    :pay_prod_cur,
    :plan,
    :primary_owner,
    :sso_provider
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      archived: :boolean,
      avatar_base_url: {:string, :uri},
      created: :integer,
      date_create: :integer,
      deleted: :boolean,
      description: {:string, :generic},
      discoverable: :map,
      domain: {:string, :generic},
      email_domain: {:string, :generic},
      enterprise_id: {:string, :generic},
      enterprise_name: {:string, :generic},
      external_org_migrations: {SlackOpenApi.Web.ObjsExternalOrgMigrations, :t},
      has_compliance_export: :boolean,
      icon: {SlackOpenApi.Web.ObjsIcon, :t},
      id: {:string, :generic},
      is_assigned: :boolean,
      is_enterprise: :integer,
      is_over_storage_limit: :boolean,
      limit_ts: :integer,
      locale: {:string, :generic},
      messages_count: :integer,
      msg_edit_window_mins: :integer,
      name: {:string, :generic},
      over_integrations_limit: :boolean,
      over_storage_limit: :boolean,
      pay_prod_cur: {:string, :generic},
      plan: {:enum, ["", "std", "plus", "compliance", "enterprise"]},
      primary_owner: {SlackOpenApi.Web.ObjsPrimaryOwner, :t},
      sso_provider: {SlackOpenApi.Web.ObjsTeamSsoProvider, :t}
    ]
  end
end
