defmodule SlackOpenApi.Client do
  @moduledoc false
  alias SlackOpenApi.Error
  alias SlackOpenApi.Config
  alias SlackOpenApi.Operation

  @spec request(map) :: {:ok, term} | {:error, term} | Operation.t()
  def request(%{opts: opts} = info) do
    %Operation{
      request_method: method,
      request_server: server,
      request_url: url
    } = operation = Operation.new(info)

    metadata = %{
      client: __MODULE__,
      info: info,
      request_method: method,
      request_server: server,
      request_url: url
    }

    :telemetry.span([:slack_open_api, :request], metadata, fn ->
      result = process_request(operation)

      if Config.wrap(opts) do
        wrapped = wrap_result(result, metadata)
        wrapped
      else
        unwrapped = {result, Map.put(metadata, :response_code, 0)}
        unwrapped
      end
    end)
  end

  @spec process_request(Operation.t()) :: Operation.t() | Error.t()
  defp process_request(operation) do
    operation = build_full_url(operation)

    make_http_request(operation)
  end

  @spec build_full_url(Operation.t()) :: Operation.t()
  defp build_full_url(%Operation{request_url: url} = operation) do
    full_url = operation.request_server <> url

    %{operation | request_url: full_url}
  end

  @spec make_http_request(Operation.t()) :: Operation.t() | Error.t()
  defp make_http_request(%Operation{} = operation) do
    req_options = build_req_options(operation)

    case Req.request(req_options) do
      {:ok, response} ->
        %{
          operation
          | response_code: response.status,
            response_headers: Map.to_list(response.headers),
            response_body: response.body
        }

      {:error, reason} ->
        %Error{code: 0, reason: reason}
    end
  end

  @spec build_req_options(Operation.t()) :: keyword()
  defp build_req_options(%Operation{} = operation) do
    base_options = [
      method: operation.request_method,
      url: operation.request_url,
      headers: operation.request_headers
    ]

    # Add auth if present
    options_with_auth =
      case operation.request_auth do
        nil -> base_options
        auth -> base_options ++ [auth: auth]
      end

    options_with_auth ++ format_body(operation)
  end

  @spec format_body(Operation.t()) :: keyword()
  defp format_body(%Operation{request_body: nil}), do: [body: ""]

  defp format_body(%Operation{request_body: body}) when is_map(body) do
    # Slack API typically expects form data
    [form: Map.to_list(body)]
  end

  defp format_body(%Operation{request_body: body}) when is_list(body) do
    # Slack API typically expects form data from keyword lists too
    [form: body]
  end

  defp format_body(%Operation{request_body: body}), do: [body: body]

  @spec wrap_result(Operation.t() | Error.t(), map) ::
          {:ok, map} | {{:ok, term}, map} | {{:error, term}, map}
  defp wrap_result(%Operation{response_body: nil, response_code: code}, metadata)
       when code < 300 do
    {:ok, Map.put(metadata, :response_code, code)}
  end

  defp wrap_result(%Operation{response_body: response, response_code: code}, metadata)
       when code < 300 do
    {{:ok, response}, Map.put(metadata, :response_code, code)}
  end

  defp wrap_result(%Operation{response_body: response, response_code: code}, metadata) do
    {{:error, response}, Map.put(metadata, :response_code, code)}
  end

  defp wrap_result(%Error{code: code, reason: reason} = error, metadata) do
    {{:error, error}, Map.merge(metadata, %{response_code: code, error: reason})}
  end
end
