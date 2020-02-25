defmodule Stripper.Whitespace do
  @moduledoc """
  This module exists for dealing with whitespace.
  """
  use Stripper.Parser.WhitespaceParser

  @doc """
  The `normalize/1` function works the same way as the `normalize!/1` function
  but it returns its output as an `:ok` tuple.

  ## Examples
      iex> normalize("a \\t\\tbunch\\n of \\f nonsense\\n")
      {:ok, "a bunch of nonsense"}


  """
  @spec normalize(string :: String.t()) :: {:ok, String.t()}
  def normalize(string) when is_binary(string) do
    {:ok, parse(string, "", false)}
  end

  @doc """
  Strip out any redundant spaces or other whitespace characters and normalize
  them to simple spaces (`\s`).

  ## Examples
      iex> normalize!("a \\t\\tbunch\\n of \\f nonsense\\n")
      "a bunch of nonsense"
  """
  @spec normalize!(string :: String.t()) :: String.t()
  def normalize!(string) when is_binary(string) do
    parse(string, "", false)
  end
end
