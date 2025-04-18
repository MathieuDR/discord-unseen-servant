import Config

# config :servant, Servant.Repo,
#     adapter: Ecto.Adapters.SQLite3,
#     database: "/path/to/sqlite/database"

config :servant,
  ecto_repos: [Servant.Repo]

config :servant, Servant.Repo,
  adapter: Ecto.Adapters.SQLite3,
  database: "./priv/data/database.db"

config :nostrum,
  token:
    System.get_env("DISCORD_TOKEN") ||
      raise("""
      environment variable DISCORD_TOKEN is missing.
      """)

# import_config "compiletime/#{config_env()}.exs"
