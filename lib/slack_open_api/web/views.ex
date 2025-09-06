defmodule SlackOpenApi.Web.Views do
  @moduledoc """
  Provides API endpoints related to views
  """

  @default_client SlackOpenApi.Client

  @type views_open_200_json_resp :: %{ok: true}

  @type views_open_default_json_resp :: %{ok: false}

  @doc """
  get `/views.open`

  Open a view for a user.

  ## Options

    * `trigger_id`: Exchange a trigger to post to the user.
    * `view`: A [view payload](/reference/surfaces/views). This must be a JSON-encoded string.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/views.open)

  """
  @spec views_open(keyword) :: {:ok, map} | {:error, map}
  def views_open(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:trigger_id, :view])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Views, :views_open},
      url: "/views.open",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Views, :views_open_200_json_resp}},
        default: {SlackOpenApi.Web.Views, :views_open_default_json_resp}
      ],
      opts: opts
    })
  end

  @type views_publish_200_json_resp :: %{ok: true}

  @type views_publish_default_json_resp :: %{ok: false}

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
  @spec views_publish(keyword) :: {:ok, map} | {:error, map}
  def views_publish(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:hash, :user_id, :view])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Views, :views_publish},
      url: "/views.publish",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Views, :views_publish_200_json_resp}},
        default: {SlackOpenApi.Web.Views, :views_publish_default_json_resp}
      ],
      opts: opts
    })
  end

  @type views_push_200_json_resp :: %{ok: true}

  @type views_push_default_json_resp :: %{ok: false}

  @doc """
  get `/views.push`

  Push a view onto the stack of a root view.

  ## Options

    * `trigger_id`: Exchange a trigger to post to the user.
    * `view`: A [view payload](/reference/surfaces/views). This must be a JSON-encoded string.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/views.push)

  """
  @spec views_push(keyword) :: {:ok, map} | {:error, map}
  def views_push(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:trigger_id, :view])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Views, :views_push},
      url: "/views.push",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Views, :views_push_200_json_resp}},
        default: {SlackOpenApi.Web.Views, :views_push_default_json_resp}
      ],
      opts: opts
    })
  end

  @type views_update_200_json_resp :: %{ok: true}

  @type views_update_default_json_resp :: %{ok: false}

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
  @spec views_update(keyword) :: {:ok, map} | {:error, map}
  def views_update(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:external_id, :hash, :view, :view_id])

    client.request(%{
      args: [],
      call: {SlackOpenApi.Web.Views, :views_update},
      url: "/views.update",
      method: :get,
      query: query,
      response: [
        {200, {SlackOpenApi.Web.Views, :views_update_200_json_resp}},
        default: {SlackOpenApi.Web.Views, :views_update_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:views_open_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:views_open_default_json_resp) do
    [ok: {:const, false}]
  end

  def __fields__(:views_publish_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:views_publish_default_json_resp) do
    [ok: {:const, false}]
  end

  def __fields__(:views_push_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:views_push_default_json_resp) do
    [ok: {:const, false}]
  end

  def __fields__(:views_update_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:views_update_default_json_resp) do
    [ok: {:const, false}]
  end
end
