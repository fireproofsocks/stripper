defmodule Stripper.WhitespaceTest do
  use ExUnit.Case

  #  doctest Stripper

  describe "normalize/1" do
    test "empty string" do
      assert {:ok, ""} = Stripper.Whitespace.normalize("")
    end

    test "leading 1 space is stripped" do
      assert {:ok, "x"} = Stripper.Whitespace.normalize(" x")
    end

    test "leading 2 spaces are stripped" do
      assert {:ok, "x"} = Stripper.Whitespace.normalize("  x")
    end

    test "trailing 2 spaces are stripped" do
      assert {:ok, "x"} = Stripper.Whitespace.normalize("x  ")
    end

    test "middle 2 spaces are normalized to 1 space" do
      assert {:ok, "x x"} = Stripper.Whitespace.normalize("x  x")
    end

    test "middle 2 tabs are normalized to 1 space" do
      assert {:ok, "x x"} = Stripper.Whitespace.normalize("x\t\tx")
    end

    test "middle 2 newlines are normalized to 1 space" do
      assert {:ok, "x x"} = Stripper.Whitespace.normalize("x\n\nx")
    end
  end

  describe "normalize!/1" do
    test "foo bar" do
        assert "foo bar" = Stripper.Whitespace.normalize!("foo\n\n\nbar")
    end
  end
end
