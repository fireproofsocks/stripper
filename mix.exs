defmodule Stripper.MixProject do
  use Mix.Project

  @version "1.4.0"

  def project do
    [
      app: :stripper,
      name: "Stripper",
      description:
        "A package for normalizing string input from unpredictable sources (such as web scraping)",
      source_url: "https://github.com/fireproofsocks/stripper",
      version: @version,
      elixir: "~> 1.9",
      deps: deps(),
      package: package(),
      docs: [
        source_ref: "v#{@version}",
        logo: "docs/logo.png",
        main: "readme",
        extras: extras()
      ]
    ]
  end

  # Extra pages for the docs
  def extras do
    [
      "README.md",
      "CHANGELOG.md",
      "CONTRIBUTING.md"
    ]
  end

  defp package do
    [
      maintainers: ["Everett Griffiths"],
      licenses: ["Apache 2.0"],
      logo: "logo.png",
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
      {:ex_doc, "~> 0.24.0", only: :dev, runtime: false}
    ]
  end
end
