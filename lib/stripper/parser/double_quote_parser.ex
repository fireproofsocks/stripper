defmodule Stripper.Parser.DoubleQuoteParser do
  @moduledoc false

  # This houses private parse functions;
  # these are functions deal specifically with normalizing whitespace.
  # These implementations of `parse/3` are meant to be composable:
  # multiple Parser modules could be mixed and matched to fulfill a complex
  # use-case.
  defmacro __using__(_opts) do
    quote do
      import Unicode.Guards

      # Some ad-hoc single quote characters not defined by the guard
      defp parse(<<head::utf8, rest::binary>>, acc, meta) when head in ~c[《》「」] do
        parse(rest, acc <> <<34::utf8>>, meta)
      end

      defp parse(<<head::utf8, rest::binary>>, acc, meta) when is_quote_mark_double(head) do
        # code point 34 is your regular straight double-quote
        parse(rest, acc <> <<34::utf8>>, meta)
      end
    end
  end
end
