# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :key_learning,
  ecto_repos: [KeyLearning.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :key_learning, KeyLearningWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "oqS6MJNUGiTR0MJvvkwgkQNyZ7IHSLRo2a1KxX5WavU1DyY8v5PhugSPmZ6iNzkx",
  render_errors: [view: KeyLearningWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: KeyLearning.PubSub,
  live_view: [signing_salt: "VhxnW7N+"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :key_learning, KeyLearning.Guardian,
       issuer: "key_learning",
       secret_key: "a+DMNted3BFK6x+QIz8KiXAhGzh+4PfrrQgjPsrDoZFKEvW7lBGz1ko8SWL9ZHIh"

config :key_learning, KeyLearningWeb.AuthAccessPipelinePlug,
        module: KeyLearning.Guardian,
        error_handler: KeyLearningWeb.AuthErrorHandlerPlug
