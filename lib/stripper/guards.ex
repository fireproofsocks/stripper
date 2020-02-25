defmodule Stripper.Guards do
  @moduledoc """
  This module defines guard clauses that can be used with Elixir functions.
  """

  @doc """
  Guards whether a UTF8 codepoint is a whitespace symbol character, including
  tabs, newlines, and a bunch of other weird unicode characters you have
  never heard of.

  ## Examples
      defmodule MyApp do
        import Stripper.Guards

        def begins_with_whitespace?(<<head::utf8, _rest::binary>>) when is_whitespace(head) do
          true
        end
      end


  Adapted from the [`unicode_guards`](https://hexdocs.pm/unicode_guards/)
  package.
  """
  defguard is_whitespace(codepoint)
           # tabs, newlines, line-feeds...
           # \s ye olde regular space
           when codepoint in 9..13 or
                  codepoint == 32 or
                  codepoint == 160 or
                  codepoint == 5760 or
                  codepoint in 8192..8202 or
                  codepoint == 8239 or
                  codepoint == 8287 or
                  codepoint == 12288
end
