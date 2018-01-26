defmodule StackyTest do
  use ExUnit.Case
  doctest Stacky

  test "greets the world" do
    assert Stacky.hello() == :world
  end
end
