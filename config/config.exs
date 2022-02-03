# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :aparg,
  ecto_repos: [Aparg.Repo]

# Configures the endpoint
config :aparg, ApargWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ikZo+zSUEaz8G0JCmL0fN0Vb5sgvs1LfaeLit0aljzV1C2dc7wo8CBPHNw2DQSZz",
  render_errors: [view: ApargWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Aparg.PubSub,
  live_view: [signing_salt: "5aPTzCic"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
