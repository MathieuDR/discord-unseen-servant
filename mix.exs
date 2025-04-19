defmodule Servant.MixProject do
  use Mix.Project

  def project do
    env = Mix.env()

    [
      app: :servant,
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: env == :prod,
      elixirc_paths: elixirc_paths(env),
      deps: deps()
    ]
  end

  defp elixirc_paths(:dev), do: ["dev" | base_elixirc_paths()]
  defp elixirc_paths(:test), do: ["test/support" | base_elixirc_paths()]
  defp elixirc_paths(_env), do: base_elixirc_paths()

  defp base_elixirc_paths, do: ["lib", "config/runtime/"]

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Servant.Application, []},
      included_applications: [:nostrum]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto, "~> 3.10"},
      {:ecto_sqlite3, "~> 0.17"},
      {:nostrum, "~> 0.10"},
      {:typed_ecto_schema, "~> 0.4.1", runtime: false},
      {:typed_struct, "~> 0.3", runtime: false},
      {:styler, "~> 0.11", only: [:test, :dev], runtime: false},
      {:ex_check, "~> 0.16.0", only: [:test, :dev], runtime: false},
      {:credo, ">= 0.0.0", only: [:test, :dev], runtime: false},
      {:dialyxir, ">= 0.0.0", only: [:test, :dev], runtime: false}
    ]
  end
end
