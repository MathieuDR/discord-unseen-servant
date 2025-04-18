import Config

config :servant, Servant.Repo,
  database: "./priv/data/test_database.db",
  pool: Ecto.Adapters.SQL.Sandbox
