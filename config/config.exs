# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :api_mock,
  ecto_repos: [ApiMock.Repo]

# Configures the endpoint
config :api_mock, ApiMockWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "BqOwcYcO6yzbc8qp6e4SxlldOLILuvJ8JS+EfaJAMC8xqrgHXtdgxP2BmbVIGZ0Q",
  render_errors: [view: ApiMockWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: ApiMock.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
