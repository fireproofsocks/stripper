defmodule Stripper.Parser.SingleQuoteParser do
  @moduledoc false

  # This houses private parse functions;
  # these are functions deal specifically with normalizing whitespace.
  # These implementations of `parse/3` are meant to be composable:
  # multiple Parser modules could be mixed and matched to fulfill a complex
  # use-case.
  defmacro __using__(_opts) do
    quote do
      defguard is_quote_mark_single(char)
               when is_integer(char) and
                      (char == 39 or
                         (char >= 8216 and char <= 8219) or
                         (char >= 8249 and char <= 8250) or
                         (char >= 10075 and char <= 10076) or
                         (char >= 12300 and char <= 12303) or
                         (char >= 65089 and char <= 65092) or
                         char == 65287 or
                         (char >= 65378 and char <= 65379))

      # Some ad-hoc single quote characters not defined by the guard
      defp parse(<<head::utf8, rest::binary>>, acc, meta) when head in ~c[`〈〉『』] do
        parse(rest, acc <> "'", meta)
      end

      # Single Quote Found! Replace with a plain old single quote
      defp parse(<<head::utf8, rest::binary>>, acc, meta) when is_quote_mark_single(head) do
        parse(rest, acc <> "'", meta)
      end
    end
  end
end
