defmodule SlackOpenApi.Web.Pins do
  @moduledoc """
  Provides API endpoints related to pins
  """

  @default_client SlackOpenApi.Client

  @type add_200_json_resp :: %{ok: true}

  @type add_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

  @doc """
  post `/pins.add`

  Pins an item to a channel.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/pins.add)

  """
  @spec add(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Pins.add_200_json_resp()}
          | {:error, SlackOpenApi.Web.Pins.add_default_json_resp()}
  def add(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Pins, :add},
      url: "/pins.add",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Pins, :add_200_json_resp}},
        default: {SlackOpenApi.Web.Pins, :add_default_json_resp}
      ],
      opts: opts
    })
  end

  @type list_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

  @doc """
  get `/pins.list`

  Lists items pinned to a channel.

  ## Options

    * `token`: Authentication token. Requires scope: `pins:read`
    * `channel`: Channel to get pinned items for.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/pins.list)

  """
  @spec list(opts :: keyword) ::
          {:ok, map} | {:error, SlackOpenApi.Web.Pins.list_default_json_resp()}
  def list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:channel, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Pins, :list},
      url: "/pins.list",
      method: :get,
      query: query,
      response: [{200, :map}, default: {SlackOpenApi.Web.Pins, :list_default_json_resp}],
      opts: opts
    })
  end

  @type remove_200_json_resp :: %{ok: true}

  @type remove_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

  @doc """
  post `/pins.remove`

  Un-pins an item from a channel.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/pins.remove)

  """
  @spec remove(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Pins.remove_200_json_resp()}
          | {:error, SlackOpenApi.Web.Pins.remove_default_json_resp()}
  def remove(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Pins, :remove},
      url: "/pins.remove",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Pins, :remove_200_json_resp}},
        default: {SlackOpenApi.Web.Pins, :remove_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:add_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:add_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "bad_timestamp",
           "message_not_found",
           "channel_not_found",
           "no_item_specified",
           "already_pinned",
           "permission_denied",
           "file_not_shared",
           "not_pinnable",
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
           "team_added_to_org",
           "invalid_json",
           "json_not_object",
           "request_timeout",
           "upgrade_required"
         ]},
      ok: {:const, false}
    ]
  end

  def __fields__(:list_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "channel_not_found",
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
           "team_added_to_org",
           "invalid_json",
           "json_not_object",
           "request_timeout",
           "upgrade_required"
         ]},
      ok: {:const, false}
    ]
  end

  def __fields__(:remove_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:remove_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "bad_timestamp",
           "file_not_found",
           "file_comment_not_found",
           "message_not_found",
           "no_item_specified",
           "not_pinned",
           "permission_denied",
           "not_authed",
           "invalid_auth",
           "account_inactive",
           "no_permission",
           "invalid_arg_name",
           "invalid_array_arg",
           "invalid_charset",
           "invalid_form_data",
           "invalid_post_typ",
           "missing_post_typ",
           "team_added_to_org",
           "invalid_json",
           "json_not_object",
           "request_timeou",
           "upgrade_required"
         ]},
      ok: {:const, false}
    ]
  end
end
