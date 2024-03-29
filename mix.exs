defmodule KafkaQuery.Mixfile do
  use Mix.Project

  def project do
    [
      app: :kafka_query,
      version: "0.0.1",
      elixir: "~> 1.12",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: [],
      deps: deps()
    ]
  end

  def application do
    [
      mod: {KafkaQuery.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:phoenix, "~> 1.6"},
      {:cowboy, "~> 2.7"},
      {:plug_cowboy, "~> 2.5"},
      {:kafka_ex, "~> 0.12.1"},
      {:jason, "~> 1.3"}
    ]
  end
end
