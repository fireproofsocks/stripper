defmodule Stripper.WhitespaceTest do
  use ExUnit.Case

  alias Stripper.Whitespace

  describe "normalize/1" do
    test "empty string" do
      assert {:ok, ""} = Whitespace.normalize("")
    end

    test "leading 1 space is stripped" do
      assert {:ok, "x"} = Whitespace.normalize(" x")
    end

    test "leading 2 spaces are stripped" do
      assert {:ok, "x"} = Whitespace.normalize("  x")
    end

    test "trailing 2 spaces are stripped" do
      assert {:ok, "x"} = Whitespace.normalize("x  ")
    end

    test "middle 2 spaces are normalized to 1 space" do
      assert {:ok, "x x"} = Whitespace.normalize("x  x")
    end

    test "middle 2 tabs are normalized to 1 space" do
      assert {:ok, "x x"} = Whitespace.normalize("x\t\tx")
    end

    test "middle 2 newlines are normalized to 1 space" do
      assert {:ok, "x x"} = Whitespace.normalize("x\n\nx")
    end
  end

  describe "normalize!/1" do
    test "foo bar" do
      assert "foo bar" = Whitespace.normalize!("foo\n\n\nbar")
    end

    test "cleans out unicode" do
      assert "foo bar" = Whitespace.normalize!("\u2009foo\u2008bar\u2003")
    end
  end
end
