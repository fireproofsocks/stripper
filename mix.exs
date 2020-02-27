defmodule Stripper.MixProject do
  use Mix.Project

  @version "1.0.0"

  def project do
    [
      app: :stripper,
      version: @version,
      elixir: "~> 1.9",
      deps: deps(),
      name: "Stripper",
      docs: [
        source_ref: "v#{@version}",
        logo: "logo.png"
      ]
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.21.2", only: :dev, runtime: false}
    ]
  end
end
