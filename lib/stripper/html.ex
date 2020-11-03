defmodule Stripper.Html do
  @moduledoc """
  This module deals with normalizing HTML.
  """

  @doc """
  Simplifies semantic HTML into unformatted text while preserving basic paragraphs.
  """
  def normalize(string, opts \\ []) when is_binary(string) do
    filter_out = Keyword.get(opts, :filter_out, ["head", "style", "script", "img", "header", "footer", "nav"])

    string
    |> Floki.parse_document!()
    |> filter_out(filter_out)
    |> Floki.raw_html()
    |> Stripper.Whitespace.normalize!()
    |> String.replace(~r|<br/>|, "\n")
    |> String.replace(~r|<p></p>|, "")
    |> String.replace(~r|</p>|, "\n\n</p>")
    |> String.replace(~r|</h1>|, "\n\n</h1>")
    |> String.replace(~r|</h2>|, "\n\n</h2>")
    |> String.replace(~r|</h3>|, "\n\n</h3>")
    |> String.replace(~r|</h4>|, "\n\n</h4>")
    |> String.replace(~r|</h5>|, "\n\n</h5>")
    |> String.replace(~r|</h6>|, "\n\n</h6>")
    |> Floki.parse_fragment!()
    |> Floki.text(sep: " ")
    |> Stripper.Quotes.normalize!()
    |> String.trim()

  end

  defp filter_out(ast, selectors) do
    selectors
    |> Enum.reduce(ast, fn selector, acc ->
      Floki.filter_out(acc, selector)
    end)
  end
end
