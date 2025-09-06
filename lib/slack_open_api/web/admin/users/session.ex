defmodule SlackOpenApi.Web.Admin.Users.Session do
  @moduledoc """
  Provides API endpoints related to admin/users/session
  """

  @default_client SlackOpenApi.Client

  @type invalidate_200_json_resp :: %{ok: true}

  @type invalidate_default_json_resp :: %{ok: false}

  @doc """
  post `/admin.users.session.invalidate`

  Invalidate a single session for a user by session_id

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.users.session.invalidate)

  """
  @spec invalidate(map, keyword) :: {:ok, map} | {:error, map}
  def invalidate(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin.Users.Session, :invalidate},
      url: "/admin.users.session.invalidate",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Admin.Users.Session, :invalidate_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.Users.Session, :invalidate_default_json_resp}
      ],
      opts: opts
    })
  end

  @type reset_200_json_resp :: %{ok: true}

  @type reset_default_json_resp :: %{ok: false}

  @doc """
  post `/admin.users.session.reset`

  Wipes all valid sessions on all devices for a given user

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.users.session.reset)

  """
  @spec reset(map, keyword) :: {:ok, map} | {:error, map}
  def reset(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin.Users.Session, :reset},
      url: "/admin.users.session.reset",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Admin.Users.Session, :reset_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.Users.Session, :reset_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:invalidate_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:invalidate_default_json_resp) do
    [ok: {:const, false}]
  end

  def __fields__(:reset_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:reset_default_json_resp) do
    [ok: {:const, false}]
  end
end
