use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :api_mock, ApiMockWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :api_mock, ApiMock.Repo,
  username: "apimock",
  password: "apimock",
  database: "api_mock_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# Configure the database for GitHub Actions
if System.get_env("GITHUB_ACTIONS") do
  config :api_mock, ApiMock.Repo,
    username: "postgres",
    password: "postgres"
end
