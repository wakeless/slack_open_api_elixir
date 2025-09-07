defmodule SlackOpenApi.Config do
  @moduledoc false

  @spec wrap(keyword) :: boolean
  def wrap(opts) do
    Keyword.get(opts, :wrap, true)
  end

  @spec server_url(keyword) :: String.t()
  def server_url(opts) do
    Keyword.get(opts, :server_url, "https://slack.com/api")
  end

  @spec token(keyword) :: String.t() | nil
  def token(opts) do
    Keyword.get(opts, :token)
  end

  @spec client_id(keyword) :: String.t() | nil
  def client_id(opts) do
    Keyword.get(opts, :client_id) || Application.get_env(:slack_open_api, :client_id)
  end

  @spec client_secret(keyword) :: String.t() | nil
  def client_secret(opts) do
    Keyword.get(opts, :client_secret) || Application.get_env(:slack_open_api, :client_secret)
  end
end
