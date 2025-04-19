import Config

get_env_or_raise = fn variable ->
  System.get_env(variable) ||
    raise("environment variable #{variable} is missing.")
end

config :logger, :default_formatter,
  # format: {Servant.Shared.ConsoleLogger, :format},
  metadata: :all,
  level: :warning

config :servant,
  ecto_repos: [Servant.Repo],
  guild: get_env_or_raise.("GUILD_ID"),
  channel: get_env_or_raise.("GUILD_ID")

config :servant, Servant.Repo,
  adapter: Ecto.Adapters.SQLite3,
  database: "./priv/data/database.db"

config :nostrum,
  token: get_env_or_raise.("DISCORD_TOKEN")

import_config "#{config_env()}.exs"
