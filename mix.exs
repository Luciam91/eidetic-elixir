defmodule Eidetic.Mixfile do
  use Mix.Project

  def project do
    [ app: :eidetic,
      version: "0.3.0",
      elixir: "~> 1.3",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),
      elixirc_paths: elixirc_paths(Mix.env),
      aliases: aliases(),
      description: description(),
      package: package(),
      test_coverage: [tool: ExCoveralls]
    ]
  end

  def application do
    [ applications: [
      :logger
    ]
  ]
  end

  def deps do
    [{:uuid, "~> 1.1"},

     {:ex_doc, ">= 0.0.0", only: :dev},
     {:excoveralls, "~> 0.6", only: :test}
    ]
  end

  def aliases do
    [ "init": ["local.hex --force", "deps.get"],
    ]
  end

  defp description do
    """
    An event-sourcing library for Elixir
    """
  end

  defp package do
    [ name: :eidetic,
      files: ["lib", "mix.exs", "README.md", "LICENSE"],
      maintainers: ["GT8Online"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/GT8Online/eidetic-elixir"}]
  end

  defp elixirc_paths(:dev),   do: ["lib"]
  defp elixirc_paths(:test),  do: elixirc_paths(:dev) ++ ["examples"]
  defp elixirc_paths(_),      do: ["lib"]
end

