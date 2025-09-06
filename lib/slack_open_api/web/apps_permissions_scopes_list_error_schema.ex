defmodule SlackOpenApi.Web.AppsPermissionsScopesListErrorSchema do
  @moduledoc """
  Provides struct and type for a AppsPermissionsScopesListErrorSchema
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
           "not_authed",
           "invalid_auth",
           "account_inactive",
           "token_revoked",
           "no_permission",
           "org_login_required",
           "user_is_bot",
           "invalid_arg_name",
           "invalid_array_arg",
           "invalid_charset",
           "invalid_form_data",
           "invalid_post_type",
           "missing_post_type",
           "team_added_to_org",
           "invalid_json",
           "json_not_object",
           "request_timeout",
           "upgrade_required",
           "fatal_error"
         ]},
      ok: {:const, false}
    ]
  end
end
