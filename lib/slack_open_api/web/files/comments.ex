defmodule SlackOpenApi.Web.Files.Comments do
  @moduledoc """
  Provides API endpoint related to files/comments
  """

  @default_client SlackOpenApi.Client

  @type delete_200_json_resp :: %{ok: true}

  @type delete_default_json_resp :: %{callstack: String.t() | nil, error: String.t(), ok: false}

  @doc """
  post `/files.comments.delete`

  Deletes an existing comment on a file.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`

  ## Resources

    * [API method documentation](https://api.slack.com/methods/files.comments.delete)

  """
  @spec delete(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Files.Comments.delete_200_json_resp()}
          | {:error, SlackOpenApi.Web.Files.Comments.delete_default_json_resp()}
  def delete(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Files.Comments, :delete},
      url: "/files.comments.delete",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Files.Comments, :delete_200_json_resp}},
        default: {SlackOpenApi.Web.Files.Comments, :delete_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:delete_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:delete_default_json_resp) do
    [
      callstack: {:string, :generic},
      error:
        {:enum,
         [
           "cant_delete",
           "comment_not_found",
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
           "invalid_json",
           "json_not_object",
           "request_timeout",
           "upgrade_required"
         ]},
      ok: {:const, false}
    ]
  end
end
