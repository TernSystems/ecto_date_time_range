defmodule EctoDateTimeRange.MixProject do
  use Mix.Project

  @scm_url "https://github.com/synchronal/ecto_date_time_range"

  def application,
    do: [
      extra_applications: [:logger]
    ]

  def project do
    [
      aliases: aliases(),
      app: :ecto_date_time_range,
      deps: deps(),
      description: "Ecto type for PostgreSQL's tstzrange",
      dialyzer: dialyzer(),
      elixir: "~> 1.13",
      elixirc_paths: elixirc_paths(Mix.env()),
      homepage_url: @scm_url,
      name: "Ecto DateTimeRange",
      package: package(),
      preferred_cli_env: [credo: :test, dialyzer: :test],
      source_url: @scm_url,
      start_permanent: Mix.env() == :prod,
      version: "0.1.0"
    ]
  end

  defp aliases,
    do: [
      test: ["ecto.create --quiet", "test"]
    ]

  defp deps,
    do: [
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.1", only: [:dev, :test], runtime: false},
      {:ecto, ">= 3.0.0"},
      {:ecto_sql, "> 3.0.0"},
      {:ecto_temp, "~> 0.1", only: :test},
      {:postgrex, ">= 0.0.0"}
    ]

  defp dialyzer,
    do: [
      plt_add_apps: [:ex_unit, :inets, :mix],
      plt_add_deps: :app_tree,
      plt_file: {:no_warn, "priv/plts/dialyzer.plt"}
    ]

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp package,
    do: [
      files: ~w[
        .formatter.exs
        README.*
        lib
        LICENSE.*
        mix.exs
      ],
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => @scm_url},
      maintainers: ["synchronal.dev", "Erik Hanson", "Eric Saxby"]
    ]
end
