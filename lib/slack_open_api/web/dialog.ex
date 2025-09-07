defmodule SlackOpenApi.Web.Dialog do
  @moduledoc """
  Provides API endpoint related to dialog
  """

  @default_client SlackOpenApi.Client

  @type open_200_json_resp :: %{ok: true}

  @type open_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

  @doc """
  post `/dialog.open`

  Open a dialog with a user

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`
    * **Description**: Request body with the following parameters:
      * `dialog` (required): The dialog definition. This must be a JSON-encoded string.
      * `trigger_id` (required): Exchange a trigger to post to the user.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/dialog.open)

  """
  @spec open(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Dialog.open_200_json_resp()}
          | {:error, SlackOpenApi.Web.Dialog.open_default_json_resp()}
  def open(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Dialog, :open},
      url: "/dialog.open",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Dialog, :open_200_json_resp}},
        default: {SlackOpenApi.Web.Dialog, :open_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:open_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:open_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "validation_errors",
           "missing_trigger",
           "missing_dialog",
           "trigger_exchanged",
           "trigger_expired",
           "invalid_trigger",
           "app_missing_action_url",
           "cannot_create_dialog",
           "failed_sending_dialog",
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
