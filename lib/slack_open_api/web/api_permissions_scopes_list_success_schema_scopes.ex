defmodule SlackOpenApi.Web.ApiPermissionsScopesListSuccessSchemaScopes do
  @moduledoc """
  Provides struct and type for a ApiPermissionsScopesListSuccessSchemaScopes
  """

  @type t :: %__MODULE__{
          app_home: [String.t()] | nil,
          channel: [String.t()] | nil,
          group: [String.t()] | nil,
          im: [String.t()] | nil,
          mpim: [String.t()] | nil,
          team: [String.t()] | nil,
          user: [String.t()] | nil
        }

  defstruct [:app_home, :channel, :group, :im, :mpim, :team, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      app_home: [string: :generic],
      channel: [string: :generic],
      group: [string: :generic],
      im: [string: :generic],
      mpim: [string: :generic],
      team: [string: :generic],
      user: [string: :generic]
    ]
  end
end
