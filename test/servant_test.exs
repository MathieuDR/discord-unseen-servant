defmodule ServantTest do
  use ExUnit.Case
  doctest Servant

  test "greets the world" do
    assert Servant.hello() == :world
  end
end
