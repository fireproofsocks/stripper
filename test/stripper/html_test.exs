defmodule Stripper.HtmlTest do
  use Stripper.FileCase

  alias Stripper.Html

  describe "normalize/2" do
    @tag contents: "wiki.html"
    test "empty string", %{contents: contents} do
      assert {:ok, ""} = Html.normalize(contents)
    end
  end
end
