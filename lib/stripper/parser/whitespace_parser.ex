defmodule Stripper.Parser.WhitespaceParser do
  @moduledoc false

  # This houses private parse functions;
  # these are functions deal specifically with normalizing whitespace.
  # These implementations of `parse/3` are meant to be composable:
  # multiple Parser modules could be mixed and matched to fulfill a complex
  # use-case.
  defmacro __using__(_opts) do
    quote do
      defguard is_whitespace(char)
               when is_integer(char) and
                      ((char >= 9 and char <= 13) or
                         char == 32 or
                         char == 160 or
                         char == 5760 or
                         (char >= 8192 and char <= 8202) or
                         char == 8239 or
                         (char == 8287 or char == 12288))

      # Leading spaces... ignore them.
      defp parse(<<head::utf8, rest::binary>>, "", %{in_space: false} = meta)
           when is_whitespace(head) do
        parse(rest, "", meta)
      end

      # Entering whitespace character: set in_space flag to true!
      defp parse(<<head::utf8, rest::binary>>, acc, %{in_space: false} = meta)
           when is_whitespace(head) do
        parse(rest, acc, %{meta | in_space: true})
      end

      # Still in whitespace! Shave off the whitespace and keep going
      defp parse(<<head::utf8, rest::binary>>, acc, %{in_space: true} = meta)
           when is_whitespace(head) do
        parse(rest, acc, meta)
      end

      # Coming out of space: acknowledge the whitespace by accumulating a space
      defp parse(<<head::utf8, rest::binary>>, acc, %{in_space: true} = meta)
           when not is_whitespace(head) do
        parse(rest, acc <> " " <> <<head::utf8>>, %{meta | in_space: false})
      end
    end
  end
end
