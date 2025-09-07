defmodule SlackOpenApi.Web.Bots do
  @moduledoc """
  Provides API endpoint related to bots
  """

  @default_client SlackOpenApi.Client

  @type info_200_json_resp :: %{bot: SlackOpenApi.Web.Bots.info_200_json_resp_bot(), ok: true}

  @type info_200_json_resp_bot :: %{
          app_id: String.t(),
          deleted: boolean,
          icons: SlackOpenApi.Web.Bots.info_200_json_resp_bot_icons(),
          id: String.t(),
          name: String.t(),
          updated: integer,
          user_id: String.t() | nil
        }

  @type info_200_json_resp_bot_icons :: %{
          image_36: String.t(),
          image_48: String.t(),
          image_72: String.t()
        }

  @type info_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

  @doc """
  post `/bots.info`

  Gets information about a bot user.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`
    * **Description**: Request body with the following parameters:
      * `token` (required): Authentication token. Requires scope: `users:read`
      * `bot`: Bot user to get info on

  ## Resources

    * [API method documentation](https://api.slack.com/methods/bots.info)

  """
  @spec info(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Bots.info_200_json_resp()}
          | {:error, SlackOpenApi.Web.Bots.info_default_json_resp()}
  def info(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Bots, :info},
      url: "/bots.info",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Bots, :info_200_json_resp}},
        default: {SlackOpenApi.Web.Bots, :info_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:info_200_json_resp) do
    [bot: {SlackOpenApi.Web.Bots, :info_200_json_resp_bot}, ok: {:const, true}]
  end

  def __fields__(:info_200_json_resp_bot) do
    [
      app_id: {:string, :generic},
      deleted: :boolean,
      icons: {SlackOpenApi.Web.Bots, :info_200_json_resp_bot_icons},
      id: {:string, :generic},
      name: {:string, :generic},
      updated: :integer,
      user_id: {:string, :generic}
    ]
  end

  def __fields__(:info_200_json_resp_bot_icons) do
    [image_36: {:string, :uri}, image_48: {:string, :uri}, image_72: {:string, :uri}]
  end

  def __fields__(:info_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "bot_not_found",
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
