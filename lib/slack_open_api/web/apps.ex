defmodule SlackOpenApi.Web.Apps do
  @moduledoc """
  Provides API endpoint related to apps
  """

  @default_client SlackOpenApi.Client

  @type uninstall_200_json_resp :: %{ok: true}

  @type uninstall_default_json_resp :: %{
          callstack: String.t() | nil,
          error: String.t(),
          ok: false
        }

  @doc """
  post `/apps.uninstall`

  Uninstalls your app from a workspace.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`
    * **Description**: Request body with the following parameters:
      * `token`: Authentication token. Requires scope: `none`
      * `client_id`: Issued when you created your application.
      * `client_secret`: Issued when you created your application.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/apps.uninstall)

  """
  @spec uninstall(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Apps.uninstall_200_json_resp()}
          | {:error, SlackOpenApi.Web.Apps.uninstall_default_json_resp()}
  def uninstall(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Apps, :uninstall},
      url: "/apps.uninstall",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Apps, :uninstall_200_json_resp}},
        default: {SlackOpenApi.Web.Apps, :uninstall_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:uninstall_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:uninstall_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "invalid_client_id",
           "bad_client_secret",
           "client_id_token_mismatch",
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
