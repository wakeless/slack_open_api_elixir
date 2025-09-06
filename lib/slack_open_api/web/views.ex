defmodule SlackOpenApi.Web.Views do
  @moduledoc """
  Provides API endpoints related to views
  """

  @default_client SlackOpenApi.Client

  @type open_200_json_resp :: %{ok: true}

  @type open_default_json_resp :: %{ok: false}

  @doc """
  get `/views.open`

  Open a view for a user.

  ## Options

    * `trigger_id`: Exchange a trigger to post to the user.
    * `view`: A [view payload](/reference/surfaces/views). This must be a JSON-encoded string.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/views.open)

  """
  @spec open(keyword) :: {:ok, map} | {:error, map}
  def open(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:trigger_id, :view])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Views, :open},
      url: "/views.open",
      method: :get,
      query: query,
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
  get `/views.publish`

  Publish a static view for a User.

  ## Options

    * `user_id`: `id` of the user you want publish a view to.
    * `view`: A [view payload](/reference/surfaces/views). This must be a JSON-encoded string.
    * `hash`: A string that represents view state to protect against possible race conditions.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/views.publish)

  """
  @spec publish(keyword) :: {:ok, map} | {:error, map}
  def publish(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:hash, :user_id, :view])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Views, :publish},
      url: "/views.publish",
      method: :get,
      query: query,
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
  get `/views.push`

  Push a view onto the stack of a root view.

  ## Options

    * `trigger_id`: Exchange a trigger to post to the user.
    * `view`: A [view payload](/reference/surfaces/views). This must be a JSON-encoded string.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/views.push)

  """
  @spec push(keyword) :: {:ok, map} | {:error, map}
  def push(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:trigger_id, :view])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Views, :push},
      url: "/views.push",
      method: :get,
      query: query,
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
  get `/views.update`

  Update an existing view.

  ## Options

    * `view_id`: A unique identifier of the view to be updated. Either `view_id` or `external_id` is required.
    * `external_id`: A unique identifier of the view set by the developer. Must be unique for all views on a team. Max length of 255 characters. Either `view_id` or `external_id` is required.
    * `view`: A [view object](/reference/surfaces/views). This must be a JSON-encoded string.
    * `hash`: A string that represents view state to protect against possible race conditions.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/views.update)

  """
  @spec update(keyword) :: {:ok, map} | {:error, map}
  def update(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:external_id, :hash, :view, :view_id])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Views, :update},
      url: "/views.update",
      method: :get,
      query: query,
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
