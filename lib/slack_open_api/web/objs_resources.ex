defmodule SlackOpenApi.Web.ObjsResources do
  @moduledoc """
  Provides struct and type for a ObjsResources
  """

  @type t :: %__MODULE__{excluded_ids: [map] | nil, ids: [map], wildcard: boolean | nil}

  defstruct [:excluded_ids, :ids, :wildcard]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [excluded_ids: [:map], ids: [:map], wildcard: :boolean]
  end
end
