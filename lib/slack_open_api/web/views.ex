defmodule SlackOpenApi.Web.Views do
  @moduledoc """
  Provides API endpoints related to views
  """

  @default_client SlackOpenApi.Client

  @type open_200_json_resp :: %{ok: true}

  @type open_default_json_resp :: %{ok: false}

  @doc """
  post `/views.open`

  Open a view for a user.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`
    * **Description**: Request body with the following parameters:
      * `trigger_id` (required): Exchange a trigger to post to the user.
      * `view` (required): A [view payload](/reference/surfaces/views). This must be a JSON-encoded string.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/views.open)

  """
  @spec open(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Views.open_200_json_resp()}
          | {:error, SlackOpenApi.Web.Views.open_default_json_resp()}
  def open(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Views, :open},
      url: "/views.open",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Views, :open_200_json_resp}},
        default: {SlackOpenApi.Web.Views, :open_default_json_resp}
      ],
      opts: opts
    })
  end

  @type publish_200_json_resp :: %{ok: true}

  @type publish_default_json_resp :: %{ok: false}

  @doc """
  post `/views.publish`

  Publish a static view for a User.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`
    * **Description**: Request body with the following parameters:
      * `user_id` (required): `id` of the user you want publish a view to.
      * `view` (required): A [view payload](/reference/surfaces/views). This must be a JSON-encoded string.
      * `hash`: A string that represents view state to protect against possible race conditions.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/views.publish)

  """
  @spec publish(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Views.publish_200_json_resp()}
          | {:error, SlackOpenApi.Web.Views.publish_default_json_resp()}
  def publish(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Views, :publish},
      url: "/views.publish",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Views, :publish_200_json_resp}},
        default: {SlackOpenApi.Web.Views, :publish_default_json_resp}
      ],
      opts: opts
    })
  end

  @type push_200_json_resp :: %{ok: true}

  @type push_default_json_resp :: %{ok: false}

  @doc """
  post `/views.push`

  Push a view onto the stack of a root view.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`
    * **Description**: Request body with the following parameters:
      * `trigger_id` (required): Exchange a trigger to post to the user.
      * `view` (required): A [view payload](/reference/surfaces/views). This must be a JSON-encoded string.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/views.push)

  """
  @spec push(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Views.push_200_json_resp()}
          | {:error, SlackOpenApi.Web.Views.push_default_json_resp()}
  def push(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Views, :push},
      url: "/views.push",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Views, :push_200_json_resp}},
        default: {SlackOpenApi.Web.Views, :push_default_json_resp}
      ],
      opts: opts
    })
  end

  @type update_200_json_resp :: %{ok: true}

  @type update_default_json_resp :: %{ok: false}

  @doc """
  post `/views.update`

  Update an existing view.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`
    * **Description**: Request body with the following parameters:
      * `view_id`: A unique identifier of the view to be updated. Either `view_id` or `external_id` is required.
      * `external_id`: A unique identifier of the view set by the developer. Must be unique for all views on a team. Max length of 255 characters. Either `view_id` or `external_id` is required.
      * `view`: A [view object](/reference/surfaces/views). This must be a JSON-encoded string.
      * `hash`: A string that represents view state to protect against possible race conditions.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/views.update)

  """
  @spec update(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Views.update_200_json_resp()}
          | {:error, SlackOpenApi.Web.Views.update_default_json_resp()}
  def update(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Views, :update},
      url: "/views.update",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Views, :update_200_json_resp}},
        default: {SlackOpenApi.Web.Views, :update_default_json_resp}
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
    [ok: {:const, false}]
  end

  def __fields__(:publish_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:publish_default_json_resp) do
    [ok: {:const, false}]
  end

  def __fields__(:push_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:push_default_json_resp) do
    [ok: {:const, false}]
  end

  def __fields__(:update_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:update_default_json_resp) do
    [ok: {:const, false}]
  end
end
