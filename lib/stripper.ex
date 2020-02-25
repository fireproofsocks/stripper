defmodule Stripper do
  @moduledoc """
  Stripper is a package made to help you normalize input from web scraping (or
  other questionable sources).
  """

  #  import Stripper.Guards

  #  @doc """
  #  ## Examples
  #      iex>
  #  """
  #  @spec normalize_whitespace(string :: String.t) :: {:ok, String.t}
  #  def normalize_whitespace(string) when is_binary(string) do
  #    {:ok, parse(string, "", false)}
  #  end
  #
  #  @doc """
  #
  #  """
  #  @spec normalize_whitespace!(string :: String.t) :: String.t
  #  def normalize_whitespace!(string) when is_binary(string) do
  #    parse(string, "", false)
  #  end

  #  # End of input string: all done!
  #  defp parse("", acc, _in_space), do: acc
  #
  #  defp parse(<<head :: utf8, rest :: binary>>, "", false) when is_whitespace(head) do
  #    parse(rest, "", false)
  #  end
  #
  #  # Entering whitespace character: set in_space flag to true!
  #  defp parse(<<head :: utf8, rest :: binary>>, acc, false) when is_whitespace(head) do
  #    parse(rest, acc, true)
  #  end
  #
  #  # Still in whitespace! Shave off the whitespace and keep going
  #  defp parse(<<head :: utf8, rest :: binary>>, acc, true) when is_whitespace(head) do
  #    parse(rest, acc, true)
  #  end
  #
  #  # Coming out of space: acknowledge the whitespace by accumulating a space
  #  defp parse(<<head :: utf8, rest :: binary>>, acc, true) when not is_whitespace(head) do
  #    parse(rest, acc <> " " <> <<head>>, false)
  #  end
  #
  #  # Not-whitespace character: accumulate it and move on
  #  defp parse(<<head :: utf8, rest :: binary>>, acc, false) when not is_whitespace(head) do
  #    parse(rest, acc <> <<head>>, false)
  #  end
end
