defmodule SlackOpenApi.Error do
  @moduledoc false

  defexception [:code, :reason]

  @type t :: %__MODULE__{
          code: non_neg_integer(),
          reason: term()
        }

  @impl Exception
  def message(%__MODULE__{code: code, reason: reason}) do
    "Request failed with status #{code}: #{inspect(reason)}"
  end
end