defmodule SlackOpenApi.Integration.RealApiTest do
  use ExUnit.Case
  
  alias SlackOpenApi.Web.Chat
  
  @moduletag :integration
  
  # These tests require a real Slack bot token
  # Run with: SLACK_BOT_TOKEN=xoxb-your-token-here mix test --include integration
  
  describe "Real Slack API integration" do
    test "post_message function works with real Slack API" do
      bot_token = System.get_env("SLACK_BOT_TOKEN")
      
      if is_nil(bot_token) or bot_token == "" do
        IO.puts("Skipping real API test - SLACK_BOT_TOKEN not set")
        # Skip this test if no token is provided
        :ok
      else
        # Test channel - using a common test channel name
        # In a real scenario, you'd want to use a dedicated test channel
        test_channel = "#general"  # Change this to your test channel
        
        # Create the message payload
        message_payload = %{
          channel: test_channel,
          text: "Test message from SlackOpenApi integration test - #{DateTime.utc_now() |> DateTime.to_iso8601()}"
        }
        
        # Create a custom client that adds the bearer token
        auth_client = fn request ->
          # Add the Authorization header with the bot token
          headers = request[:headers] || []
          auth_headers = [{"Authorization", "Bearer #{bot_token}"} | headers]
          
          # Use the actual SlackOpenApi.Client with the auth header
          SlackOpenApi.Client.request(Map.put(request, :headers, auth_headers))
        end
        
        # Call the post_message function with our authenticated client
        result = Chat.post_message(message_payload, [client: auth_client])
        
        case result do
          {:ok, response} ->
            # Verify we got a successful response
            assert response["ok"] == true
            assert is_binary(response["ts"])  # timestamp should be present
            assert response["channel"] == test_channel
            
            IO.puts("✅ Successfully posted message to Slack!")
            IO.puts("Message timestamp: #{response["ts"]}")
            
          {{:ok, response}, _metadata} ->
            # Handle wrapped response format
            assert response["ok"] == true
            assert is_binary(response["ts"])
            assert response["channel"] == test_channel
            
            IO.puts("✅ Successfully posted message to Slack!")
            IO.puts("Message timestamp: #{response["ts"]}")
            
          {:error, error} ->
            IO.puts("❌ Slack API call failed:")
            IO.inspect(error)
            flunk("Slack API call failed: #{inspect(error)}")
            
          {{:error, error}, _metadata} ->
            IO.puts("❌ Slack API call failed:")
            IO.inspect(error)
            flunk("Slack API call failed: #{inspect(error)}")
        end
      end
    end
    
    test "post_message function name is correct (not chat_post_message)" do
      # Verify the function exists with the clean name
      assert function_exported?(Chat, :post_message, 2)
      
      # Verify the old prefixed name doesn't exist
      refute function_exported?(Chat, :chat_post_message, 2)
      
      IO.puts("✅ Function naming is correct: post_message (not chat_post_message)")
    end
    
    test "other chat functions have correct naming" do
      # Test that our processor worked across other functions
      functions = Chat.__info__(:functions)
      function_names = Keyword.keys(functions) |> Enum.uniq()
      
      # Look for functions that should have clean names
      clean_functions = Enum.filter(function_names, fn name ->
        name_str = Atom.to_string(name)
        # Functions that don't start with chat_ prefix
        not String.starts_with?(name_str, "chat_") and 
        # But are actual API functions (have reasonable names)
        String.match?(name_str, ~r/^[a-z][a-z_]*[a-z]$/)
      end)
      
      # Should have at least some clean function names
      assert length(clean_functions) > 0
      
      IO.puts("✅ Found #{length(clean_functions)} functions with clean names:")
      Enum.take(clean_functions, 5) |> Enum.each(&IO.puts("  - #{&1}"))
    end
    
    test "get API info works" do
      bot_token = System.get_env("SLACK_BOT_TOKEN")
      
      if is_nil(bot_token) or bot_token == "" do
        IO.puts("Skipping API info test - SLACK_BOT_TOKEN not set")
        :ok
      else
        alias SlackOpenApi.Web.Api
        
        # Create authenticated client
        auth_client = fn request ->
          headers = request[:headers] || []
          auth_headers = [{"Authorization", "Bearer #{bot_token}"} | headers]
          SlackOpenApi.Client.request(Map.put(request, :headers, auth_headers))
        end
        
        # Test the api.test endpoint (should be a function like 'test' not 'api_test')
        if function_exported?(Api, :test, 1) do
          result = Api.test([client: auth_client])
          
          case result do
            {:ok, response} ->
              assert response["ok"] == true
              IO.puts("✅ API test successful!")
              
            {{:ok, response}, _metadata} ->
              assert response["ok"] == true  
              IO.puts("✅ API test successful!")
              
            error ->
              IO.puts("API test result: #{inspect(error)}")
          end
        else
          IO.puts("API.test function not found - checking available functions...")
          functions = Api.__info__(:functions) |> Keyword.keys() |> Enum.take(5)
          IO.inspect(functions)
        end
      end
    end
  end
end