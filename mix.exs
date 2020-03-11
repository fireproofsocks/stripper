defmodule Stripper.MixProject do
  use Mix.Project

  @version "1.1.0"

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
      docs: [
        source_ref: "v#{@version}",
        logo: "logo.png"
      ]
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
        "logo.png",
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
      {:unicode_guards, "~> 0.2.0"},
      {:ex_doc, "~> 0.21.2", only: :dev, runtime: false}
    ]
  end
end
