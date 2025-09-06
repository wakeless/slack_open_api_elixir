defmodule SlackOpenApi.Web.ObjsChannel do
  @moduledoc """
  Provides struct and type for a ObjsChannel
  """

  @type t :: %__MODULE__{
          accepted_user: String.t() | nil,
          created: integer,
          creator: String.t(),
          id: String.t(),
          is_archived: boolean | nil,
          is_channel: boolean,
          is_frozen: boolean | nil,
          is_general: boolean | nil,
          is_member: boolean | nil,
          is_moved: integer | nil,
          is_mpim: boolean,
          is_non_threadable: boolean | nil,
          is_org_shared: boolean,
          is_pending_ext_shared: boolean | nil,
          is_private: boolean,
          is_read_only: boolean | nil,
          is_shared: boolean,
          is_thread_only: boolean | nil,
          last_read: String.t() | nil,
          latest: map | nil,
          members: [String.t()],
          name: String.t(),
          name_normalized: String.t(),
          num_members: integer | nil,
          pending_shared: [String.t()] | nil,
          previous_names: [String.t()] | nil,
          priority: number | nil,
          purpose: SlackOpenApi.Web.ObjsChannelPurpose.t(),
          topic: SlackOpenApi.Web.ObjsChannelTopic.t(),
          unlinked: integer | nil,
          unread_count: integer | nil,
          unread_count_display: integer | nil
        }

  defstruct [
    :accepted_user,
    :created,
    :creator,
    :id,
    :is_archived,
    :is_channel,
    :is_frozen,
    :is_general,
    :is_member,
    :is_moved,
    :is_mpim,
    :is_non_threadable,
    :is_org_shared,
    :is_pending_ext_shared,
    :is_private,
    :is_read_only,
    :is_shared,
    :is_thread_only,
    :last_read,
    :latest,
    :members,
    :name,
    :name_normalized,
    :num_members,
    :pending_shared,
    :previous_names,
    :priority,
    :purpose,
    :topic,
    :unlinked,
    :unread_count,
    :unread_count_display
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      accepted_user: {:string, :generic},
      created: :integer,
      creator: {:string, :generic},
      id: {:string, :generic},
      is_archived: :boolean,
      is_channel: :boolean,
      is_frozen: :boolean,
      is_general: :boolean,
      is_member: :boolean,
      is_moved: :integer,
      is_mpim: :boolean,
      is_non_threadable: :boolean,
      is_org_shared: :boolean,
      is_pending_ext_shared: :boolean,
      is_private: :boolean,
      is_read_only: :boolean,
      is_shared: :boolean,
      is_thread_only: :boolean,
      last_read: {:string, :generic},
      latest: :map,
      members: [string: :generic],
      name: {:string, :generic},
      name_normalized: {:string, :generic},
      num_members: :integer,
      pending_shared: [string: :generic],
      previous_names: [string: :generic],
      priority: :number,
      purpose: {SlackOpenApi.Web.ObjsChannelPurpose, :t},
      topic: {SlackOpenApi.Web.ObjsChannelTopic, :t},
      unlinked: :integer,
      unread_count: :integer,
      unread_count_display: :integer
    ]
  end
end
