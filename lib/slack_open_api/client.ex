defmodule SlackOpenApi.Client do
  @moduledoc false
  alias SlackOpenApi.Error
  alias SlackOpenApi.Config  
  alias SlackOpenApi.Operation

  @spec request(map) :: {:ok, term} | {:error, term} | Operation.t()
  def request(%{opts: opts} = info) do
    IO.puts("=== SlackOpenApi Client Debug ===")
    IO.inspect(info, label: "Request info")
    
    %Operation{
      request_method: method,
      request_server: server,
      request_url: url
    } = operation = Operation.new(info)

    IO.inspect(operation, label: "Created operation")

    metadata = %{
      client: __MODULE__,
      info: info,
      request_method: method,
      request_server: server,
      request_url: url
    }

    :telemetry.span([:slack_open_api, :request], metadata, fn ->
      IO.puts("Processing request...")
      result = process_request(operation)
      IO.inspect(result, label: "Process request result")

      if Config.wrap(opts) do
        wrapped = wrap_result(result, metadata)
        IO.inspect(wrapped, label: "Wrapped result")
        wrapped
      else
        unwrapped = {result, Map.put(metadata, :response_code, 0)}
        IO.inspect(unwrapped, label: "Unwrapped result")
        unwrapped
      end
    end)
  end

  @spec process_request(Operation.t()) :: Operation.t() | Error.t()
  defp process_request(operation) do
    IO.puts("Step 1: Build full URL")
    operation = build_full_url(operation)
    IO.inspect(operation, label: "After URL building")
    
    IO.puts("Step 2: Making HTTP request")
    make_http_request(operation)
  end

  @spec build_full_url(Operation.t()) :: Operation.t()
  defp build_full_url(%Operation{request_url: url} = operation) do
    IO.puts("Building URL: #{operation.request_server} + #{url}")
    full_url = operation.request_server <> url
    IO.puts("Full URL: #{full_url}")
    
    %{operation | request_url: full_url}
  end

  @spec make_http_request(Operation.t()) :: Operation.t() | Error.t()
  defp make_http_request(%Operation{} = operation) do
    req_options = build_req_options(operation)
    IO.inspect(req_options, label: "Req options")
    
    IO.puts("Making HTTP request...")
    case Req.request(req_options) do
      {:ok, response} ->
        IO.inspect(response.status, label: "Response status")
        IO.inspect(response.headers, label: "Response headers")
        IO.inspect(response.body, label: "Response body")
        
        %{operation | 
          response_code: response.status,
          response_headers: Map.to_list(response.headers),
          response_body: response.body
        }
        
      {:error, reason} ->
        IO.inspect(reason, label: "HTTP request error")
        %Error{code: 0, reason: reason}
    end
  end

  @spec build_req_options(Operation.t()) :: keyword()
  defp build_req_options(%Operation{} = operation) do
    [
      method: operation.request_method,
      url: operation.request_url,
      headers: operation.request_headers
    ] ++ format_body(operation)
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