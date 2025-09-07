defmodule SlackOpenApi.Web.Apps.Permissions.Resources do
  @moduledoc """
  Provides API endpoint related to apps/permissions/resources
  """

  @default_client SlackOpenApi.Client

  @type list_200_json_resp :: %{
          ok: true,
          resources: [SlackOpenApi.Web.Apps.Permissions.Resources.list_200_json_resp_resources()],
          response_metadata:
            SlackOpenApi.Web.Apps.Permissions.Resources.list_200_json_resp_response_metadata()
            | nil
        }

  @type list_200_json_resp_resources :: %{id: String.t() | nil, type: String.t() | nil}

  @type list_200_json_resp_response_metadata :: %{next_cursor: String.t()}

  @type list_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

  @doc """
  get `/apps.permissions.resources.list`

  Returns list of resource grants this app has on a team.

  ## Options

    * `token`: Authentication token. Requires scope: `none`
    * `cursor`: Paginate through collections of data by setting the `cursor` parameter to a `next_cursor` attribute returned by a previous request's `response_metadata`. Default value fetches the first "page" of the collection. See [pagination](/docs/pagination) for more detail.
    * `limit`: The maximum number of items to return.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/apps.permissions.resources.list)

  """
  @spec list(opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Apps.Permissions.Resources.list_200_json_resp()}
          | {:error, SlackOpenApi.Web.Apps.Permissions.Resources.list_default_json_resp()}
  def list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:cursor, :limit, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Apps.Permissions.Resources, :list},
      url: "/apps.permissions.resources.list",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Apps.Permissions.Resources, :list_200_json_resp}},
        default: {SlackOpenApi.Web.Apps.Permissions.Resources, :list_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:list_200_json_resp) do
    [
      ok: {:const, true},
      resources: [{SlackOpenApi.Web.Apps.Permissions.Resources, :list_200_json_resp_resources}],
      response_metadata:
        {SlackOpenApi.Web.Apps.Permissions.Resources, :list_200_json_resp_response_metadata}
    ]
  end

  def __fields__(:list_200_json_resp_resources) do
    [id: {:string, :generic}, type: {:string, :generic}]
  end

  def __fields__(:list_200_json_resp_response_metadata) do
    [next_cursor: {:string, :generic}]
  end

  def __fields__(:list_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "invalid_cursor",
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
