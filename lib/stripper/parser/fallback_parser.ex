defmodule Stripper.Parser.FallbackParser do
  @moduledoc false

  defmacro __using__(_opts) do
    quote do
      # End of input string: all done!
      defp parse("", acc, _meta), do: acc

      # This is the fallback collector: shift the character onto the accumulator and move on
      defp parse(<<head::binary-size(1), rest::binary>>, acc, meta) do
        parse(rest, acc <> head, meta)
      end
    end
  end
end
