# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :amiguitos,
  ecto_repos: [Amiguitos.Repo]

# Configures the endpoint
config :amiguitos, Amiguitos.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ole3Di3935u+JYCIQFRchLjRv18Sb5kXWjZGaT1CgdLS+kB/YdWibFJxaJ/arqGx",
  render_errors: [view: Amiguitos.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Amiguitos.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
