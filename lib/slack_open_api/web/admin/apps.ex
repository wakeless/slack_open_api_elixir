defmodule SlackOpenApi.Web.Admin.Apps do
  @moduledoc """
  Provides API endpoints related to admin/apps
  """

  @default_client SlackOpenApi.Client

  @type approve_200_json_resp :: %{ok: true}

  @type approve_default_json_resp :: %{ok: false}

  @doc """
  post `/admin.apps.approve`

  Approve an app for installation on a workspace.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.apps.approve)

  """
  @spec approve(map, keyword) :: {:ok, map} | {:error, map}
  def approve(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin.Apps, :approve},
      url: "/admin.apps.approve",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Admin.Apps, :approve_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.Apps, :approve_default_json_resp}
      ],
      opts: opts
    })
  end

  @type restrict_200_json_resp :: %{ok: true}

  @type restrict_default_json_resp :: %{ok: false}

  @doc """
  post `/admin.apps.restrict`

  Restrict an app for installation on a workspace.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.apps.restrict)

  """
  @spec restrict(map, keyword) :: {:ok, map} | {:error, map}
  def restrict(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Admin.Apps, :restrict},
      url: "/admin.apps.restrict",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Admin.Apps, :restrict_200_json_resp}},
        default: {SlackOpenApi.Web.Admin.Apps, :restrict_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:approve_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:approve_default_json_resp) do
    [ok: {:const, false}]
  end

  def __fields__(:restrict_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:restrict_default_json_resp) do
    [ok: {:const, false}]
  end
end
