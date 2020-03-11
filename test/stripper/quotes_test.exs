defmodule Stripper.QuotesTest do
  use ExUnit.Case

  alias Stripper.Quotes

  describe "normalize/1" do
    test "empty string" do
      assert {:ok, ""} = Quotes.normalize("")
    end

    test "regular single quotes in and out" do
      assert {:ok, "Some single's here"} = Quotes.normalize("Some single's here")
    end

    test "regular double quotes in and out" do
      assert {:ok, ~S|and the bartender said "that's not a duck!"|} =
               Quotes.normalize(~S|and the bartender said "that's not a duck!"|)
    end

    test "backticks" do
      assert {:ok, ~S|I don't know what an apostrophe is|} =
               Quotes.normalize(~S|I don`t know what an apostrophe is|)
    end

    test "tibetan single quotes" do
      assert {:ok, ~S|'works'|} = Quotes.normalize(~S|〈works〉|)
    end

    test "crazy double quotes" do
      assert {:ok, ~S|"it" "stop"|} = Quotes.normalize(~S|«it» „stop“|)
    end

    test "japanese single quotes" do
      assert {:ok, ~S|'single'|} = Quotes.normalize(~S|『single』|)
    end

    test "japanese double quotes" do
      assert {:ok, ~S|"double"|} = Quotes.normalize(~S|「double」|)
    end

    test "crazy quotes mixed" do
      assert {:ok, ~S|'make' "it" "stop" "please"|} =
               Quotes.normalize(~S|‘make’ «it» „stop“ 《please》|)
    end
  end
end
