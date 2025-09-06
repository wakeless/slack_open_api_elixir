defmodule SlackOpenApi.Web.Migration do
  @moduledoc """
  Provides API endpoint related to migration
  """

  @default_client SlackOpenApi.Client

  @type migration_exchange_200_json_resp :: %{
          enterprise_id: String.t(),
          invalid_user_ids: [String.t()] | nil,
          ok: true,
          team_id: String.t(),
          user_id_map: map | nil
        }

  @type migration_exchange_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  get `/migration.exchange`

  For Enterprise Grid workspaces, map local user IDs to global user IDs

  ## Options

    * `token`: Authentication token. Requires scope: `tokens.basic`
    * `users`: A comma-separated list of user ids, up to 400 per request
    * `team_id`: Specify team_id starts with `T` in case of Org Token
    * `to_old`: Specify `true` to convert `W` global user IDs to workspace-specific `U` IDs. Defaults to `false`.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/migration.exchange)

  """
  @spec migration_exchange(keyword) :: {:ok, map} | {:error, map}
  def migration_exchange(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:team_id, :to_old, :token, :users])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Migration, :migration_exchange},
      url: "/migration.exchange",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Migration, :migration_exchange_200_json_resp}},
        default: {SlackOpenApi.Web.Migration, :migration_exchange_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:migration_exchange_200_json_resp) do
    [
      enterprise_id: {:string, :generic},
      invalid_user_ids: [string: :generic],
      ok: {:const, true},
      team_id: {:string, :generic},
      user_id_map: :map
    ]
  end

  def __fields__(:migration_exchange_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "not_enterprise_team",
           "too_many_users",
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
end
