use Mix.Config

# Configure your database
config :goody, Goody.Repo,
  url: System.get_env("DATABASE_URL"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10"),
  pool: Ecto.Adapters.SQL.Sandbox

# By default, a server is not run during tests. One is required by Wallaby.
config :goody, GoodyWeb.Endpoint,
  http: [port: 4002],
  server: true

# Print only warnings and errors during test
config :logger, level: :warn

config :wallaby,
  driver: Wallaby.Experimental.Chrome
