defmodule SlackOpenApi.Web.ObjsReminder do
  @moduledoc """
  Provides struct and type for a ObjsReminder
  """

  @type t :: %__MODULE__{
          complete_ts: integer | nil,
          creator: String.t(),
          id: String.t(),
          recurring: boolean,
          text: String.t(),
          time: integer | nil,
          user: String.t()
        }

  defstruct [:complete_ts, :creator, :id, :recurring, :text, :time, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      complete_ts: :integer,
      creator: {:string, :generic},
      id: {:string, :generic},
      recurring: :boolean,
      text: {:string, :generic},
      time: :integer,
      user: {:string, :generic}
    ]
  end
end
