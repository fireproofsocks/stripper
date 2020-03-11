# NOTE: Examples here uses escaped stuff like `\\n` but in normal usage you'd
# use `\n` -- the escaping is necessary ONLY SO THE DOCS + HTML GET PROPERLY
# GENERATED.

defmodule Stripper.Quotes do
  @moduledoc """
  This module exists for dealing with quotes. When parsing text from word
  processors or web pages, it is inevitable that you will encounter various
  smart-quotes, curly quotes, and even some backticks masquerading as apostrophes!

  This module will normalize all quotes to their simple straight-laced variants
  so you can focus on parsing the text. This even handles the weird
  ["Guillemets"](https://en.wikipedia.org/wiki/Guillemet) (a.k.a. Chevrons) used
  in some languages.
  """
  use Stripper.Parser.DoubleQuoteParser
  use Stripper.Parser.SingleQuoteParser
  use Stripper.Parser.FallbackParser

  @doc """
  The `normalize/1` function works the same way as the `normalize!/1` function
  but it returns its output as an `:ok` tuple.

  This is a convenience function provided to have idiomatic function specs.

  ## Usage Examples
      iex> normalize(~S|‘make’ «it» „stop“|)
      {:ok, ~S|'make' "it" "stop"|}

  """
  @spec normalize(string :: String.t()) :: {:ok, String.t()}
  def normalize(string) when is_binary(string) do
    {:ok, parse(string, "", %{})}
  end

  @doc """
  Replace any smart, curly, or bracket quotes with their boring equivalents `"` and `'`.

  ## Examples
      iex> normalize!(~S|‘make’ «it» „stop“|)
      ~S|'make' "it" "stop"|
  """
  @spec normalize!(string :: String.t()) :: String.t()
  def normalize!(string) when is_binary(string) do
    parse(string, "", %{})
  end
end
