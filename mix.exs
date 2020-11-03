defmodule Stripper.MixProject do
  use Mix.Project

  @version "1.2.0"

  def project do
    [
      app: :stripper,
      name: "Stripper",
      description:
        "A package for normalizing input from unpredictable sources (such as web scraping)",
      source_url: "https://github.com/fireproofsocks/stripper",
      version: @version,
      elixir: "~> 1.9",
      deps: deps(),
      package: package(),
      elixirc_paths: elixirc_paths(Mix.env()),
      docs: [
        source_ref: "v#{@version}",
        logo: "docs/logo.png",
        main: "overview",
        extras: extras()
      ]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Extra pages for the docs
  def extras do
    [
      "docs/overview.md"
    ]
  end

  defp package do
    [
      maintainers: ["Everett Griffiths"],
      licenses: ["Apache 2.0"],
      logo: "docs/logo.png",
      links: links(),
      files: [
        "lib",
        "docs/logo.png",
        "mix.exs",
        "README*",
        "CHANGELOG*",
        "LICENSE*"
      ]
    ]
  end

  def links do
    %{
      "GitHub" => "https://github.com/fireproofsocks/stripper",
      "Readme" => "https://github.com/fireproofsocks/stripper/blob/v#{@version}/README.md",
      "Changelog" => "https://github.com/fireproofsocks/stripper/blob/v#{@version}/CHANGELOG.md"
    }
  end

  defp deps do
    [
      {:unicode_guards, "~> 0.3.1"},
      {:floki, "~> 0.28.0"},
      {:ex_doc, "~> 0.21.2", only: :dev, runtime: false}
    ]
  end
end
