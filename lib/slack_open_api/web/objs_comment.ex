defmodule SlackOpenApi.Web.ObjsComment do
  @moduledoc """
  Provides struct and type for a ObjsComment
  """

  @type t :: %__MODULE__{
          comment: String.t(),
          created: integer,
          id: String.t(),
          is_intro: boolean,
          is_starred: boolean | nil,
          num_stars: integer | nil,
          pinned_info: SlackOpenApi.Web.DefsPinnedInfo.t() | nil,
          pinned_to: [String.t()] | nil,
          reactions: [SlackOpenApi.Web.ObjsReaction.t()] | nil,
          timestamp: integer,
          user: String.t()
        }

  defstruct [
    :comment,
    :created,
    :id,
    :is_intro,
    :is_starred,
    :num_stars,
    :pinned_info,
    :pinned_to,
    :reactions,
    :timestamp,
    :user
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      comment: {:string, :generic},
      created: :integer,
      id: {:string, :generic},
      is_intro: :boolean,
      is_starred: :boolean,
      num_stars: :integer,
      pinned_info: {SlackOpenApi.Web.DefsPinnedInfo, :t},
      pinned_to: [string: :generic],
      reactions: [{SlackOpenApi.Web.ObjsReaction, :t}],
      timestamp: :integer,
      user: {:string, :generic}
    ]
  end
end
