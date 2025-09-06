defmodule SlackOpenApiTest do
  use ExUnit.Case
  doctest SlackOpenApi

  test "greets the world" do
    assert SlackOpenApi.hello() == :world
  end
end
