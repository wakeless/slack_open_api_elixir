if Mix.env() == :dev || Mix.env() == :test do
  defmodule SlackOpenApi.Processor do
    @moduledoc """
    Custom processor for SlackOpenApi that adjusts function naming and other customizations.
    """
    use OpenAPI.Processor

    # Override function naming to convert camelCase to snake_case and remove module prefix
    def operation_function_name(state, operation) do
      # For Slack API, we want to extract just the function name from underscore-separated operation IDs
      # e.g., "chat_postMessage" -> "postMessage", "oauth_v2_access" -> "access"
      case operation.operation_id do
        nil ->
          # No operation_id, fall back to default behavior
          OpenAPI.Processor.Naming.operation_function(state, operation)

        operation_id when is_binary(operation_id) ->
          # Split by underscore and determine where the module part ends
          parts = String.split(operation_id, "_")

          function_part =
            case parts do
              # Handle patterns like "chat_postMessage" -> "postMessage"
              [_module, function] -> function
              # Handle patterns like "oauth_v2_access" -> "access" or "admin_apps_approve" -> "approve"
              [_module, _submodule, function] -> function
              # Handle patterns like "admin_apps_approved_list" -> "list"
              # Four or more parts: take the last part as function name
              parts when length(parts) >= 4 -> List.last(parts)
              # Single part, use as-is
              [single] -> single
              # Fallback
              _ -> operation_id
            end

          # Convert camelCase to snake_case and normalize to atom
          normalized_function =
            function_part
            |> camel_to_snake()
            |> OpenAPI.Processor.Naming.normalize_identifier()

          # Handle reserved keywords by appending underscore
          final_function =
            case normalized_function do
              "end" -> "end_"
              "if" -> "if_"
              "case" -> "case_"
              "when" -> "when_"
              "do" -> "do_"
              "else" -> "else_"
              "rescue" -> "rescue_"
              "catch" -> "catch_"
              "after" -> "after_"
              "true" -> "true_"
              "false" -> "false_"
              "nil" -> "nil_"
              other -> other
            end

          String.to_atom(final_function)
      end
    end

    # Convert camelCase string to snake_case
    defp camel_to_snake(string) when is_binary(string) do
      string
      |> String.replace(~r/([A-Z])/, "_\\1")
      |> String.downcase()
      |> String.replace(~r/^_/, "")
    end

    defp camel_to_snake(atom) when is_atom(atom) do
      atom
      |> Atom.to_string()
      |> camel_to_snake()
      |> String.to_atom()
    end

    # Override module naming to create nested modules for better organization
    def operation_module_names(state, operation) do
      case operation.operation_id do
        nil ->
          # No operation_id, use default behavior
          OpenAPI.Processor.Naming.operation_modules(state, operation)

        operation_id when is_binary(operation_id) ->
          # Split by underscore to create nested module structure
          parts = String.split(operation_id, "_")

          module_parts =
            case parts do
              [single] ->
                # Single part like "test" -> ["Test"]
                [String.capitalize(single)]

              [first, second] ->
                # Two parts - create single module from first part
                # e.g., "calls_end" -> ["Calls"], "chat_postMessage" -> ["Chat"]
                [String.capitalize(first)]

              [first, second, third] ->
                # Three parts - create two-level nesting
                # e.g., "admin_apps_approve" -> ["Admin", "Apps"]
                second_camelized = second |> Macro.camelize()
                [String.capitalize(first), second_camelized]

              [first, second, third, fourth | _] ->
                # Four or more parts - create three-level nesting
                # e.g., "admin_apps_approved_list" -> ["Admin", "Apps", "Approved"]
                second_camelized = second |> Macro.camelize()
                third_camelized = third |> Macro.camelize()
                [String.capitalize(first), second_camelized, third_camelized]
            end

          # Convert string list to actual module atoms
          module_atom = Module.concat(module_parts)
          [module_atom]
      end
    end
  end
end
