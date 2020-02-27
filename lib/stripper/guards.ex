defmodule Stripper.Guards do
  @moduledoc """
  This module defines guard clauses that are used internally by the `Stripper`
  package but can be used with your own Elixir functions.
  """

  @doc """
  This guard checks whether a UTF8 codepoint represents any kind of space,
  including tabs, newlines, and a bunch of other weird unicode characters you have
  never heard of.

  Because this defines codepoints as numbers, it's important to use `::utf8`
  pattern matching (instead of `::binary-size(1)` or other matching).

  ## Examples

      defmodule MyApp do
        import Stripper.Guards

        def starts_with_whitespace?(<<head::utf8, _rest::binary>>) when is_whitespace(head) do
          true
        end
      end


  Adapted from the [`unicode_guards`](https://hexdocs.pm/unicode_guards/)
  package.
  """
  defguard is_whitespace(codepoint)
           when codepoint in 9..13 or
                  codepoint == 32 or
                  codepoint == 160 or
                  codepoint == 5760 or
                  codepoint in 8192..8202 or
                  codepoint == 8239 or
                  codepoint == 8287 or
                  codepoint == 12288
end
