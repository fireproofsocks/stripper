# NOTE: Examples here uses escaped stuff like `\\n` but in normal usage you'd
# use `\n` -- the escaping is necessary ONLY SO THE DOCS + HTML GET PROPERLY
# GENERATED.

defmodule Stripper.Whitespace do
  @moduledoc """
  This module exists for dealing with whitespace. A space is a space is a space,
  right? Wrong. There are multiple [unicode](https://home.unicode.org/)
  characters that represent whitespace: tabs, newlines, line-feeds, and a slew
  of lesser known characters that are technically different entities but all of
  which could be referred to as "space".

  Sometimes, too many distinctions is a bad thing. A human might be able to read
  text peppered with a dozen different variations in space characters, but some
  processes may not. This module offers functions that strip away all the
  nonsense and leaves bare the simple spaces as nature intended.
  """
  use Stripper.Parser.WhitespaceParser

  @doc """
  The `normalize/1` function works the same way as the `normalize!/1` function
  but it returns its output as an `:ok` tuple.

  This is a convenience function provided to have idiomatic function specs.

  ## Usage Examples
      iex> normalize("a \\t\\tbunch\\n of \\f nonsense\\n")
      {:ok, "a bunch of nonsense"}

  """
  @spec normalize(string :: String.t()) :: {:ok, String.t()}
  def normalize(string) when is_binary(string) do
    {:ok, parse(string, "", false)}
  end

  @doc """
  Strip out any redundant spaces or other whitespace characters and normalize
  them to simple spaces (`" "`). Multiple spaces all get collapsed down to one
  space. Newlines, carriage returns, tabs, line-feeds et al all get replaced
  with a regular space character.

  Functionally, this is equivalent to trimming the result of a regular
  expression like the following:

      iex> value = "your value here"
      iex> Regex.replace(~r/\\s+/, value, " ")


  ## Examples
      iex> normalize!("a \\t\\tbunch\\n of \\f nonsense\\n")
      "a bunch of nonsense"

      iex> normalize!("    trim me please          ")
      "trim me please"

      iex> normalize!("foo\\n\\n\\nbar")
      "foo bar"
  """
  @spec normalize!(string :: String.t()) :: String.t()
  def normalize!(string) when is_binary(string) do
    parse(string, "", false)
  end

end
