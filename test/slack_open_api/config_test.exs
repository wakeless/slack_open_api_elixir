defmodule SlackOpenApi.ConfigTest do
  use ExUnit.Case

  alias SlackOpenApi.Web.Api
  alias SlackOpenApi.Config

  setup do
    bypass = Bypass.open()
    {:ok, bypass: bypass}
  end

  describe "server_url configuration" do
    test "uses server_url from opts when provided" do
      opts = [server_url: "https://custom.slack.example.com/api"]

      assert Config.server_url(opts) == "https://custom.slack.example.com/api"
    end

    test "uses application config when server_url not in opts" do
      # Set application config
      original_value = Application.get_env(:slack_open_api, :server_url)
      Application.put_env(:slack_open_api, :server_url, "https://config.slack.example.com/api")

      try do
        opts = []
        assert Config.server_url(opts) == "https://config.slack.example.com/api"
      after
        # Restore original value
        if original_value do
          Application.put_env(:slack_open_api, :server_url, original_value)
        else
          Application.delete_env(:slack_open_api, :server_url)
        end
      end
    end

    test "falls back to default when no configuration is provided" do
      # Ensure no application config is set
      original_value = Application.get_env(:slack_open_api, :server_url)
      Application.delete_env(:slack_open_api, :server_url)

      try do
        opts = []
        assert Config.server_url(opts) == "https://slack.com/api"
      after
        # Restore original value
        if original_value do
          Application.put_env(:slack_open_api, :server_url, original_value)
        end
      end
    end

    test "opts take precedence over application config" do
      # Set application config
      original_value = Application.get_env(:slack_open_api, :server_url)
      Application.put_env(:slack_open_api, :server_url, "https://config.slack.example.com/api")

      try do
        opts = [server_url: "https://opts.slack.example.com/api"]
        assert Config.server_url(opts) == "https://opts.slack.example.com/api"
      after
        # Restore original value
        if original_value do
          Application.put_env(:slack_open_api, :server_url, original_value)
        else
          Application.delete_env(:slack_open_api, :server_url)
        end
      end
    end
  end

  describe "server_url integration with actual API calls" do
    test "client uses custom server_url from opts when making API calls", %{bypass: bypass} do
      # Set up bypass to respond to API test call (POST method)
      Bypass.expect(bypass, "POST", "/api.test", fn conn ->
        conn
        |> Plug.Conn.put_resp_content_type("application/json")
        |> Plug.Conn.resp(200, ~s({"ok": true, "url": "https://custom.slack.com/"}))
      end)

      custom_server_url = "http://localhost:#{bypass.port}"

      result = Api.test(%{}, server_url: custom_server_url)

      assert {:ok, response} = result
      # Response comes back as a parsed map
      assert is_map(response)
      assert response["ok"] == true
    end

    test "client uses server_url from application config when not in opts", %{bypass: bypass} do
      # Set up bypass to respond to API test call (POST method)
      Bypass.expect(bypass, "POST", "/api.test", fn conn ->
        conn
        |> Plug.Conn.put_resp_content_type("application/json")
        |> Plug.Conn.resp(200, ~s({"ok": true, "url": "https://config.slack.com/"}))
      end)

      # Set application config to bypass URL
      original_value = Application.get_env(:slack_open_api, :server_url)
      custom_server_url = "http://localhost:#{bypass.port}"
      Application.put_env(:slack_open_api, :server_url, custom_server_url)

      try do
        result = Api.test(%{})

        assert {:ok, response} = result
        # Response comes back as a parsed map
        assert is_map(response)
        assert response["ok"] == true
      after
        # Restore original value
        if original_value do
          Application.put_env(:slack_open_api, :server_url, original_value)
        else
          Application.delete_env(:slack_open_api, :server_url)
        end
      end
    end

    test "client uses default server_url when no configuration provided" do
      # This test would normally hit the real Slack API, so we'll just verify
      # that the operation struct gets the correct server URL without making the actual request
      original_value = Application.get_env(:slack_open_api, :server_url)
      Application.delete_env(:slack_open_api, :server_url)

      try do
        # Use the internal Operation module to verify server URL resolution
        operation =
          SlackOpenApi.Operation.new(%{
            method: :get,
            url: "/api.test",
            opts: []
          })

        assert operation.request_server == "https://slack.com/api"
      after
        # Restore original value
        if original_value do
          Application.put_env(:slack_open_api, :server_url, original_value)
        end
      end
    end
  end
end
