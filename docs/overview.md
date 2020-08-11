# Stripper Overview

Stripper handles use cases where a string needs to be cleaned or normalized by stripping out 
extraneous characters.  It is parser-based (not regular expression based), so it does all its work in one pass and 
should be performant.

## Examples

Simplifying quotes:
```elixir
iex> Stripper.Quotes.normalize!(~S|‘make’ «it» „stop“|)
      "'make' \"it\" \"stop\""
```

Normalizing spaces:
```elixir
iex> Stripper.Whitespace.normalize!("a \\t\\tbunch\\n of \\f nonsense\\n")
  "a bunch of nonsense"

iex> Stripper.Whitespace.normalize!("    trim me please          ")
  "trim me please"

iex> Stripper.Whitespace.normalize!("foo\\n\\n\\nbar")
  "foo bar"

iex> Stripper.Whitespace.normalize!("\\u2009unicode\\u2008space\\u2003")
  "unicode space"
```

See `Stripper` for more details.
