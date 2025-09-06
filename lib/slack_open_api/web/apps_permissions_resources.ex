defmodule SlackOpenApi.Web.AppsPermissionsResources do
  @moduledoc """
  Provides API endpoint related to apps permissions resources
  """

  @default_client SlackOpenApi.Client

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
  @spec apps_permissions_resources_list(keyword) ::
          {:ok, SlackOpenApi.Web.AppsPermissionsResourcesListSuccessSchema.t()}
          | {:error, SlackOpenApi.Web.AppsPermissionsResourcesListErrorSchema.t()}
  def apps_permissions_resources_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:cursor, :limit, :token])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.AppsPermissionsResources, :apps_permissions_resources_list},
      url: "/apps.permissions.resources.list",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.AppsPermissionsResourcesListSuccessSchema, :t}},
        default: {SlackOpenApi.Web.AppsPermissionsResourcesListErrorSchema, :t}
      ],
      opts: opts
    })
  end
end
