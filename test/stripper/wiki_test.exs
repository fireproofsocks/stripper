defmodule Stripper.WikiTest do
  use Stripper.FileCase

  alias Stripper.Wiki

  describe "normalize/2" do
    @tag contents: "wiki.html"
    test "empty string", %{contents: contents} do
      assert {:ok, ""} = Wiki.normalize(contents)
    end
  end
end
