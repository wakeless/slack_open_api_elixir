defmodule SlackOpenApi.Operation do
  @moduledoc false

  defstruct [
    :request_method,
    :request_server,
    :request_url,
    :request_body,
    :request_headers,
    :request_auth,
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
          request_auth: {:basic, String.t()} | nil,
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
      request_auth: Map.get(info, :auth),
      private: %{
        __opts__: opts,
        __info__: info
      }
    }
  end

  @spec build_headers(map, keyword) :: [{String.t(), String.t()}]
  defp build_headers(info, opts) do
    headers = Map.get(info, :headers, [])

    # Only add bearer token if no auth field is provided
    # (auth field takes precedence for basic auth)
    case {Map.get(info, :auth), SlackOpenApi.Config.token(opts)} do
      {nil, nil} -> headers
      {nil, token} -> [{"Authorization", "Bearer #{token}"} | headers]
      # auth field will be handled by Req
      {_auth, _} -> headers
    end
  end
end
