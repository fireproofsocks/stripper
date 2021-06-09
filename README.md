# Stripper

[![Module Version](https://img.shields.io/hexpm/v/dotenvy.svg)](https://hex.pm/packages/dotenvy)
[![Hex Docs](https://img.shields.io/badge/hex-docs-lightgreen.svg)](https://hexdocs.pm/dotenvy/)
[![Total Download](https://img.shields.io/hexpm/dt/dotenvy.svg)](https://hex.pm/packages/dotenvy)
[![License](https://img.shields.io/hexpm/l/dotenvy.svg)](https://hex.pm/packages/dotenvy)
[![Last Updated](https://img.shields.io/github/last-commit/fireproofsocks/dotenvy.svg)](https://github.com/fireproofsocks/dotenvy/commits/master)

`Stripper` is an [Elixir](https://elixir-lang.org/) package for normalizing input from unpredictable sources (such as web scraping), useful as a pre-processing step in ETL pipelines for machine learning or data analysis. It is parser-based (not regular expression based), so it does all its work in one pass and should be performant.

Why the name? Because it describes the purpose and it's memorable -- get over it ;)

## Examples

Normalizing whitespace:

```elixir
iex> Stripper.Whitespace.normalize!("   random\tstuff\fI   scraped\t\t\tfrom\nthe web\n\n")
"random stuff I scraped from the web"
```

This will reduce all unicode whitespace and separator characters to the humble space -- multiple spaces will be collapsed into one.

Simplifying quotes:

```elixir
iex> Stripper.Quotes.normalize!(~S|‘make’ «it» „stop“|)
      "'make' \"it\" \"stop\""
```

See the [online documentation](https://hex.pm/packages/stripper) for more information.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `stripper` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:stripper, "~> 1.4.0"}
  ]
end
```

## Contributing

See the [Contributing Guidelines](CONTRIBUTING.md) for more information.

## Image Attribution

The logo image is "wire strippers" by Designs by MB from the [the Noun Project](https://thenounproject.com/)
