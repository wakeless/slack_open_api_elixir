defmodule SlackOpenApi.Web.Workflows do
  @moduledoc """
  Provides API endpoints related to workflows
  """

  @default_client SlackOpenApi.Client

  @type step_completed_200_json_resp :: %{ok: true}

  @type step_completed_default_json_resp :: %{ok: false}

  @doc """
  post `/workflows.stepCompleted`

  Indicate that an app's step in a workflow completed execution.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`
    * **Description**: Request body with the following parameters:
      * `workflow_step_execute_id` (required): Context identifier that maps to the correct workflow step execution.
      * `outputs`: Key-value object of outputs from your step. Keys of this object reflect the configured `key` properties of your [`outputs`](/reference/workflows/workflow_step#output) array from your `workflow_step` object.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/workflows.stepCompleted)

  """
  @spec step_completed(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Workflows.step_completed_200_json_resp()}
          | {:error, SlackOpenApi.Web.Workflows.step_completed_default_json_resp()}
  def step_completed(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Workflows, :step_completed},
      url: "/workflows.stepCompleted",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Workflows, :step_completed_200_json_resp}},
        default: {SlackOpenApi.Web.Workflows, :step_completed_default_json_resp}
      ],
      opts: opts
    })
  end

  @type step_failed_200_json_resp :: %{ok: true}

  @type step_failed_default_json_resp :: %{ok: false}

  @doc """
  post `/workflows.stepFailed`

  Indicate that an app's step in a workflow failed to execute.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`
    * **Description**: Request body with the following parameters:
      * `workflow_step_execute_id` (required): Context identifier that maps to the correct workflow step execution.
      * `error` (required): A JSON-based object with a `message` property that should contain a human readable error message.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/workflows.stepFailed)

  """
  @spec step_failed(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Workflows.step_failed_200_json_resp()}
          | {:error, SlackOpenApi.Web.Workflows.step_failed_default_json_resp()}
  def step_failed(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Workflows, :step_failed},
      url: "/workflows.stepFailed",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Workflows, :step_failed_200_json_resp}},
        default: {SlackOpenApi.Web.Workflows, :step_failed_default_json_resp}
      ],
      opts: opts
    })
  end

  @type update_step_200_json_resp :: %{ok: true}

  @type update_step_default_json_resp :: %{ok: false}

  @doc """
  post `/workflows.updateStep`

  Update the configuration for a workflow extension step.

  ## Request Body

    * **Content Types**: `application/x-www-form-urlencoded`
    * **Description**: Request body with the following parameters:
      * `workflow_step_edit_id` (required): A context identifier provided with `view_submission` payloads used to call back to `workflows.updateStep`.
      * `inputs`: A JSON key-value map of inputs required from a user during configuration. This is the data your app expects to receive when the workflow step starts. **Please note**: the embedded variable format is set and replaced by the workflow system. You cannot create custom variables that will be replaced at runtime. [Read more about variables in workflow steps here](/workflows/steps#variables).
      * `outputs`: An JSON array of output objects used during step execution. This is the data your app agrees to provide when your workflow step was executed.
      * `step_name`: An optional field that can be used to override the step name that is shown in the Workflow Builder.
      * `step_image_url`: An optional field that can be used to override app image that is shown in the Workflow Builder.

  ## Resources

    * [API method documentation](https://api.slack.com/methods/workflows.updateStep)

  """
  @spec update_step(body :: map, opts :: keyword) ::
          {:ok, SlackOpenApi.Web.Workflows.update_step_200_json_resp()}
          | {:error, SlackOpenApi.Web.Workflows.update_step_default_json_resp()}
  def update_step(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SlackOpenApi.Web.Workflows, :update_step},
      url: "/workflows.updateStep",
      body: body,
      method: :post,
      request: [{"application/x-www-form-urlencoded", :map}],
      response: [
        {200, {SlackOpenApi.Web.Workflows, :update_step_200_json_resp}},
        default: {SlackOpenApi.Web.Workflows, :update_step_default_json_resp}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:step_completed_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:step_completed_default_json_resp) do
    [ok: {:const, false}]
  end

  def __fields__(:step_failed_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:step_failed_default_json_resp) do
    [ok: {:const, false}]
  end

  def __fields__(:update_step_200_json_resp) do
    [ok: {:const, true}]
  end

  def __fields__(:update_step_default_json_resp) do
    [ok: {:const, false}]
  end
end
