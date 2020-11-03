defmodule Stripper.Wiki do
  @moduledoc """
  This module deals with normalizing pages of content on [Wikipedia.org](https://wikipedia.org/),
  one of the most popular websites on the planet.
  As an alternative to scraping the HTML, you can instead use the [REST API](https://www.mediawiki.org/wiki/API:REST_API)
  E.g. https://en.wikipedia.org/w/rest.php/v1/page/Jupiter
  """

  @doc """
  Simplifies semantic HTML into unformatted text while preserving basic paragraphs.
  """
  def normalize(string, opts \\ []) when is_binary(string) do
    filter_out = Keyword.get(opts, :filter_out, ["head", "style", "script", "img", "header", "footer", "nav", ".noprint", ".mw-jump-link", ".infobox", ".navigation-not-searchable"])

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
