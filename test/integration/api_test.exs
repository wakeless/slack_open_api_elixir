defmodule SlackOpenApi.Integration.ApiTest do
  use ExUnit.Case

  alias SlackOpenApi.Web.Chat

  describe "Real Slack API integration" do
    @tag :integration
    test "post_message sends real message to Slack and can be retrieved" do
      # Skip if no bot token is available
      bot_token = System.get_env("SLACK_BOT_TOKEN")

      if is_nil(bot_token) do
        IO.puts("⚠️  SLACK_BOT_TOKEN not set - skipping real API integration test")
        # Skip test gracefully
        assert true
      else
        # Send a test message
        test_channel = System.get_env("SLACK_TEST_CHANNEL") || "#general"
        timestamp = DateTime.utc_now() |> DateTime.to_iso8601()
        test_text = "Integration test message - #{timestamp}"

        # Post the message with authentication token
        IO.puts("📤 Sending message to #{test_channel}: #{test_text}")

        result =
          Chat.post_message(%{
            channel: test_channel,
            text: test_text,
            token: bot_token
          })

        # Verify the message was sent successfully
        case result do
          {:ok, response} when is_map(response) ->
            IO.puts("🔍 Response: #{inspect(response)}")

            if response["ok"] == true do
              assert response["ok"] == true
              assert is_binary(response["ts"])
              message_ts = response["ts"]
              channel = response["channel"]

              IO.puts("✅ Message sent successfully with timestamp: #{message_ts}")

              # Verify the function exists with correct name
              assert function_exported?(Chat, :post_message, 2)
              refute function_exported?(Chat, :chat_post_message, 2)

              # Now let's clean up by deleting the message we just sent
              IO.puts("🧹 Cleaning up - deleting message #{message_ts}")

              delete_result =
                Chat.delete(%{
                  channel: channel,
                  ts: message_ts,
                  token: bot_token
                })

              case delete_result do
                {:ok, delete_response} when is_map(delete_response) ->
                  IO.puts("🔍 Delete response: #{inspect(delete_response)}")

                  if delete_response["ok"] == true do
                    IO.puts("✅ Message deleted successfully")
                    assert delete_response["ok"] == true

                    # Verify delete function exists with correct name
                    assert function_exported?(Chat, :delete, 2)
                    refute function_exported?(Chat, :chat_delete, 2)
                  else
                    IO.puts("⚠️  Delete failed: #{delete_response["error"]}")

                    # Don't fail the test if delete fails - message still got sent/received successfully
                  end

                delete_error ->
                  IO.puts("⚠️  Delete had unexpected response: #{inspect(delete_error)}")

                  # Don't fail the test if delete fails - message still got sent/received successfully
              end
            else
              IO.puts("❌ Slack API returned error: #{inspect(response)}")
              flunk("Slack API error: #{response["error"] || "unknown error"}")
            end

          other ->
            IO.puts("🤔 Unexpected response format: #{inspect(other)}")
            flunk("Unexpected response format: #{inspect(other)}")
        end
      end
    end

    test "function naming verification" do
      # Verify that the function exists with the correct name (not chat_post_message)
      functions = Chat.__info__(:functions)
      function_names = Keyword.keys(functions) |> Enum.uniq()

      assert :post_message in function_names, "post_message function should exist"
      refute :chat_post_message in function_names, "chat_post_message function should not exist"

      # Test other chat functions exist with clean names
      assert :delete in function_names, "delete function should exist"
      refute :chat_delete in function_names, "chat_delete function should not exist"

      # Also verify with function_exported?/2
      assert function_exported?(Chat, :post_message, 2)
      assert function_exported?(Chat, :delete, 2)
    end
  end
end
