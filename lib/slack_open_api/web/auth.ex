defmodule SlackOpenApi.Web.Auth do
  @moduledoc """
  Provides API endpoints related to auth
  """

  @default_client SlackOpenApi.Client

  @type revoke_200_json_resp :: %{ok: true, revoked: boolean}

  @type revoke_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

  @doc """
  get `/auth.revoke`

  Revokes a token.

  ## Options

    * `token`: Authentication token. Requires scope: `none`
    * `test`: Setting this parameter to `1` triggers a _testing mode_ where the specified token will not actually be revoked.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/auth.revoke)

  """
  @spec revoke(keyword) :: {:ok, map} | {:error, map}
  def revoke(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:test, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Auth, :revoke},
      url: "/auth.revoke",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Auth, :revoke_200_json_resp}},
        default: {SlackOpenApi.Web.Auth, :revoke_default_json_resp}
      ],
      opts: opts
    })
  end

  @type test_200_json_resp :: %{
          bot_id: String.t() | nil,
          is_enterprise_install: boolean | nil,
          ok: true,
          team: String.t(),
          team_id: String.t(),
          url: String.t(),
          user: String.t(),
          user_id: String.t()
        }

  @type test_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

  @doc """
  get `/auth.test`

  Checks authentication & identity.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/auth.test)

  """
  @spec test(keyword) :: {:ok, map} | {:error, map}
  def test opts \\ [] do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Auth, :test},
      url: "/auth.test",
      method: :get,
      response: [
        {200, {SlackOpenApi.Web.Auth, :test_200_json_resp}},
        default: {SlackOpenApi.Web.Auth, :test_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:revoke_200_json_resp) do
    [ok: {:const, true}, revoked: :boolean]
  end

  def __fields__(:revoke_default_json_resp) do
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

  def __fields__(:test_200_json_resp) do
    [
      bot_id: {:string, :generic},
      is_enterprise_install: :boolean,
      ok: {:const, true},
      team: {:string, :generic},
      team_id: {:string, :generic},
      url: {:string, :generic},
      user: {:string, :generic},
      user_id: {:string, :generic}
    ]
  end

  def __fields__(:test_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "not_authed",
           "invalid_auth",
           "token_revoked",
           "account_inactive",
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
