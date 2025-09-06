defmodule SlackOpenApi.Web.FilesComments do
  @moduledoc """
  Provides API endpoint related to files comments
  """

  @default_client SlackOpenApi.Client

  @doc """
  post `/files.comments.delete`

  Deletes an existing comment on a file.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/files.comments.delete)

  """
  @spec files_comments_delete(map, keyword) ::
          {:ok, SlackOpenApi.Web.FilesCommentsDeleteSchema.t()}
          | {:error, SlackOpenApi.Web.FilesCommentsDeleteErrorSchema.t()}
  def files_comments_delete(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.FilesComments, :files_comments_delete},
      url: "/files.comments.delete",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.FilesCommentsDeleteSchema, :t}},
        default: {SlackOpenApi.Web.FilesCommentsDeleteErrorSchema, :t}
      ],
      opts: opts
    })
  end
end
