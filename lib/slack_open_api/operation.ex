defmodule SlackOpenApi.Operation do
  @moduledoc false

  defstruct [
    :request_method,
    :request_server,
    :request_url,
    :request_body,
    :request_headers,
    :response_body,
    :response_code,
    :response_headers,
    :private
  ]

  @type t :: %__MODULE__{
          request_method: atom(),
          request_server: String.t(),
          request_url: String.t(),
          request_body: term(),
          request_headers: [{String.t(), String.t()}],
          response_body: term(),
          response_code: non_neg_integer(),
          response_headers: [{String.t(), String.t()}],
          private: map()
        }

  @spec new(map) :: t()
  def new(%{method: method, url: url, opts: opts} = info) do
    %__MODULE__{
      request_method: method,
      request_server: SlackOpenApi.Config.server_url(opts),
      request_url: url,
      request_body: Map.get(info, :body),
      request_headers: build_headers(info, opts),
      private: %{
        __opts__: opts,
        __info__: info
      }
    }
  end

  @spec build_headers(map, keyword) :: [{String.t(), String.t()}]
  defp build_headers(info, opts) do
    headers = Map.get(info, :headers, [])
    
    case SlackOpenApi.Config.token(opts) do
      nil -> headers
      token -> [{"Authorization", "Bearer #{token}"} | headers]
    end
  end
end