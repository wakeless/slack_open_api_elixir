defmodule SlackOpenApi.ProcessorTest do
  use ExUnit.Case, async: true

  alias SlackOpenApi.Processor
  alias OpenAPI.Spec.Path.Operation, as: OperationSpec

  # Create a mock operation struct for testing
  defp mock_operation(operation_id) do
    %OperationSpec{operation_id: operation_id}
  end

  describe "camel_to_snake/1" do
    test "converts camelCase to snake_case" do
      # Test the private function through operation_function_name
      # We'll create operations that should trigger the conversion

      # Since camel_to_snake is private, let's test it indirectly through 
      # operation_function_name with a mock state
      state = %{}

      # Test basic camelCase conversion
      operation = mock_operation("postMessage")
      result = Processor.operation_function_name(state, operation)
      assert result == :post_message

      # Test multiple capital letters
      operation = mock_operation("getPermalink")
      result = Processor.operation_function_name(state, operation)
      assert result == :get_permalink

      # Test already snake_case single word (should remain unchanged)
      operation = mock_operation("deleteMessage")
      result = Processor.operation_function_name(state, operation)
      assert result == :delete_message

      # Test single word
      operation = mock_operation("delete")
      result = Processor.operation_function_name(state, operation)
      assert result == :delete
    end
  end

  describe "module prefix removal" do
    test "removes chat prefix from function names" do
      state = %{}

      # Test chat_postMessage -> post_message
      operation = mock_operation("chat_postMessage")
      result = Processor.operation_function_name(state, operation)
      assert result == :post_message

      # Test chat_deleteMessage -> delete_message  
      operation = mock_operation("chat_deleteMessage")
      result = Processor.operation_function_name(state, operation)
      assert result == :delete_message

      # Test chat_getPermalink -> get_permalink
      operation = mock_operation("chat_getPermalink")
      result = Processor.operation_function_name(state, operation)
      assert result == :get_permalink
    end

    test "removes oauth_v2 prefix from function names" do
      state = %{}

      # Test oauth_v2_access -> access
      operation = mock_operation("oauth_v2_access")
      result = Processor.operation_function_name(state, operation)
      assert result == :access
    end

    test "removes users prefix from function names" do
      state = %{}

      # Test users_getProfile -> get_profile
      operation = mock_operation("users_getProfile")
      result = Processor.operation_function_name(state, operation)
      assert result == :get_profile

      # Test users_setProfile -> set_profile
      operation = mock_operation("users_setProfile")
      result = Processor.operation_function_name(state, operation)
      assert result == :set_profile
    end

    test "handles functions without module prefix" do
      state = %{}

      # Test standalone function names
      operation = mock_operation("getInfo")
      result = Processor.operation_function_name(state, operation)
      assert result == :get_info

      operation = mock_operation("testConnection")
      result = Processor.operation_function_name(state, operation)
      assert result == :test_connection
    end

    test "handles complex nested module prefixes" do
      state = %{}

      # Test admin_conversations_create -> create
      operation = mock_operation("admin_conversations_create")
      result = Processor.operation_function_name(state, operation)
      assert result == :create

      # Test admin_users_session_reset -> reset (takes only the last part)
      operation = mock_operation("admin_users_session_reset")
      result = Processor.operation_function_name(state, operation)
      assert result == :reset
    end
  end

  describe "edge cases" do
    test "handles operation_id with no underscores" do
      state = %{}
      operation = mock_operation("simpleFunction")

      result = Processor.operation_function_name(state, operation)
      assert result == :simple_function
    end
  end

  describe "module naming" do
    test "creates nested modules for admin operations to avoid conflicts" do
      state = %{}

      # Test admin_apps_approve -> should go to Admin.Apps module with approve() function
      operation = mock_operation("admin_apps_approve")
      result = Processor.operation_module_names(state, operation)
      # Should return nested module path as module atoms
      assert result == [Admin.Apps]

      # Test admin_inviteRequests_approve -> should go to Admin.InviteRequests module
      operation = mock_operation("admin_inviteRequests_approve")
      result = Processor.operation_module_names(state, operation)
      assert result == [Admin.InviteRequests]

      # Test admin_apps_approved_list -> should go to Admin.Apps.Approved module with list() function
      operation = mock_operation("admin_apps_approved_list")
      result = Processor.operation_module_names(state, operation)
      assert result == [Admin.Apps.Approved]

      # Test admin_apps_requests_list -> should go to Admin.Apps.Requests module with list() function
      operation = mock_operation("admin_apps_requests_list")
      result = Processor.operation_module_names(state, operation)
      assert result == [Admin.Apps.Requests]

      # Now both can have list() functions without conflict!
    end

    test "creates single modules for simple operations" do
      state = %{}

      # Test chat_postMessage -> should go to Chat module
      operation = mock_operation("chat_postMessage")
      result = Processor.operation_module_names(state, operation)
      assert result == [Chat]
    end

    test "creates nested modules for oauth operations" do
      state = %{}

      # Test oauth_v2_access -> should go to Oauth.V2 module
      operation = mock_operation("oauth_v2_access")
      result = Processor.operation_module_names(state, operation)
      assert result == [Oauth.V2]
    end

    test "handles single word operation ids" do
      state = %{}

      operation = mock_operation("test")
      result = Processor.operation_module_names(state, operation)
      assert result == [Test]
    end

    test "creates appropriate nesting for complex operations" do
      state = %{}

      # Test admin_conversations_restrictAccess_addGroup -> Admin.Conversations.RestrictAccess
      operation = mock_operation("admin_conversations_restrictAccess_addGroup")
      result = Processor.operation_module_names(state, operation)
      assert result == [Admin.Conversations.RestrictAccess]
    end

    test "creates single-level modules for simple operations" do
      state = %{}

      # Test calls_end -> should go to Calls module (not Calls.End)
      # The function should be end(), not a separate End module
      operation = mock_operation("calls_end")
      result = Processor.operation_module_names(state, operation)
      assert result == [Calls]

      # Test pins_add -> should go to Pins module  
      operation = mock_operation("pins_add")
      result = Processor.operation_module_names(state, operation)
      assert result == [Pins]

      # Test bots_info -> should go to Bots module
      operation = mock_operation("bots_info")
      result = Processor.operation_module_names(state, operation)
      assert result == [Bots]

      # Test function name extraction for simple operations
      # calls_end should create Calls.end_() function (reserved keyword handling)
      operation = mock_operation("calls_end")
      function_result = Processor.operation_function_name(state, operation)
      assert function_result == :end_
    end
  end
end
