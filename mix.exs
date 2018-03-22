defmodule GTmetrix.MixProject do
  use Mix.Project

  def project do
    [
      app: :gtmetrix,
      name: "GTmetrix",
      version: "0.1.0",
      description: description(),
      package: package(),
      source_url: "https://github.com/antoine-duchenet/gtmetrix",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      build_embedded: Mix.env == :prod,
      deps: deps()
    ]
  end

  defp description() do
    "GTmetrix REST API client."
  end

  defp package() do
    [
      # This option is only needed when you don't want to use the OTP application name
      name: "postgrex",
      maintainers: ["Antoine Duchenet"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/antoine-duchenet/gtmetrix"}
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.0"},
      {:poison, "~> 3.1"}
    ]
  end
end
