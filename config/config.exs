# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :mystery_night,
  ecto_repos: [MysteryNight.Repo]

# Configures the endpoint
config :mystery_night, MysteryNight.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "vAMg7DzAvjGT33iCUmAks/HaZIO4pmzlYpXQ7VIssI7g4ECwjEglQem9gFopxSpM",
  render_errors: [view: MysteryNight.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MysteryNight.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Add template engines
config :phoenix, :template_engines,
    slim: PhoenixSlime.Engine,
    slime: PhoenixSlime.Engine

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
