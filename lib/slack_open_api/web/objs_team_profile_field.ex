defmodule SlackOpenApi.Web.ObjsTeamProfileField do
  @moduledoc """
  Provides struct and type for a ObjsTeamProfileField
  """

  @type t :: %__MODULE__{
          field_name: String.t() | nil,
          hint: String.t(),
          id: String.t(),
          is_hidden: boolean | nil,
          label: String.t(),
          options: map | nil,
          ordering: number,
          possible_values: [String.t()] | nil,
          type: String.t()
        }

  defstruct [
    :field_name,
    :hint,
    :id,
    :is_hidden,
    :label,
    :options,
    :ordering,
    :possible_values,
    :type
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      field_name: {:string, :generic},
      hint: {:string, :generic},
      id: {:string, :generic},
      is_hidden: :boolean,
      label: {:string, :generic},
      options: :map,
      ordering: :number,
      possible_values: [string: :generic],
      type: {:enum, ["text", "date", "link", "mailto", "options_list", "user"]}
    ]
  end
end
