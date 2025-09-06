defmodule SlackOpenApi.Web.AdminApps do
  @moduledoc """
  Provides API endpoints related to admin apps
  """

  @default_client SlackOpenApi.Client

  @doc """
  post `/admin.apps.approve`

  Approve an app for installation on a workspace.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.apps.approve)

  """
  @spec admin_apps_approve(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_apps_approve(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.AdminApps, :admin_apps_approve},
      url: "/admin.apps.approve",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.DefaultSuccessTemplate, :t}},
        default: {SlackOpenApi.Web.DefaultErrorTemplate, :t}
      ],
      opts: opts
    })
  end

  @doc """
  post `/admin.apps.restrict`

  Restrict an app for installation on a workspace.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/admin.apps.restrict)

  """
  @spec admin_apps_restrict(map, keyword) ::
          {:ok, SlackOpenApi.Web.DefaultSuccessTemplate.t()}
          | {:error, SlackOpenApi.Web.DefaultErrorTemplate.t()}
  def admin_apps_restrict(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.AdminApps, :admin_apps_restrict},
      url: "/admin.apps.restrict",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.DefaultSuccessTemplate, :t}},
        default: {SlackOpenApi.Web.DefaultErrorTemplate, :t}
      ],
      opts: opts
    })
  end
end
