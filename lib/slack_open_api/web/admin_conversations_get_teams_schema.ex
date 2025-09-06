defmodule SlackOpenApi.Web.AdminConversationsGetTeamsSchema do
  @moduledoc """
  Provides struct and type for a AdminConversationsGetTeamsSchema
  """

  @type t :: %__MODULE__{
          ok: true,
          response_metadata:
            SlackOpenApi.Web.AdminConversationsGetTeamsSchemaResponseMetadata.t() | nil,
          team_ids: [String.t()]
        }

  defstruct [:ok, :response_metadata, :team_ids]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      ok: {:const, true},
      response_metadata: {SlackOpenApi.Web.AdminConversationsGetTeamsSchemaResponseMetadata, :t},
      team_ids: [string: :generic]
    ]
  end
end
