defmodule Stripper.Parser.WhitespaceParser do
  @moduledoc false

  # This houses private parse functions;
  # these are functions deal specifically with normalizing whitespace.
  # Multiple Parser modules could be used to fulfill a single use-case.
  defmacro __using__(_opts) do
    quote do
      import Stripper.Guards

      # End of input string: all done!
      defp parse("", acc, _in_space), do: acc

      # Leading spaces... ignore them.
      defp parse(<<head::utf8, rest::binary>>, "", false) when is_whitespace(head) do
        parse(rest, "", false)
      end

      # Entering whitespace character: set in_space flag to true!
      defp parse(<<head::utf8, rest::binary>>, acc, false) when is_whitespace(head) do
        parse(rest, acc, true)
      end

      # Still in whitespace! Shave off the whitespace and keep going
      defp parse(<<head::utf8, rest::binary>>, acc, true) when is_whitespace(head) do
        parse(rest, acc, true)
      end

      # Coming out of space: acknowledge the whitespace by accumulating a space
      defp parse(<<head::utf8, rest::binary>>, acc, true) when not is_whitespace(head) do
        parse(rest, acc <> " " <> <<head>>, false)
      end

      # Not-whitespace character: accumulate it and move on
      defp parse(<<head::utf8, rest::binary>>, acc, false) when not is_whitespace(head) do
        parse(rest, acc <> <<head>>, false)
      end
    end
  end
end
