defmodule SlackOpenApi.Web.FilesCommentsDeleteErrorSchema do
  @moduledoc """
  Provides struct and type for a FilesCommentsDeleteErrorSchema
  """

  @type t :: %__MODULE__{callstack: String.t() | nil, error: String.t(), ok: false}

  defstruct [:callstack, :error, :ok]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "cant_delete",
           "comment_not_found",
           "not_authed",
           "invalid_auth",
           "account_inactive",
           "no_permission",
           "invalid_arg_name",
           "invalid_array_arg",
           "invalid_charset",
           "invalid_form_data",
           "invalid_post_type",
           "missing_post_type",
           "invalid_json",
           "json_not_object",
           "request_timeout",
           "upgrade_required"
         ]},
      ok: {:const, false}
    ]
  end
end
