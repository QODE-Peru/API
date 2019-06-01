use Mix.Config

# Configure your database
config :kaypi_api, KaypiApi.Repo,
  username: "kaypi_api_dev",
  password: "123456789",
  database: "kaypi_api_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :kaypi_api, KaypiApiWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
