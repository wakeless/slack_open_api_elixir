defmodule SlackOpenApi.Web.ObjsPaging do
  @moduledoc """
  Provides struct and type for a ObjsPaging
  """

  @type t :: %__MODULE__{
          count: integer | nil,
          page: integer,
          pages: integer | nil,
          per_page: integer | nil,
          spill: integer | nil,
          total: integer
        }

  defstruct [:count, :page, :pages, :per_page, :spill, :total]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      count: :integer,
      page: :integer,
      pages: :integer,
      per_page: :integer,
      spill: :integer,
      total: :integer
    ]
  end
end
