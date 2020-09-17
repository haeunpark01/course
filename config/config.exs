# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :course,
  ecto_repos: [Course.Repo]

# Configures the endpoint
config :course, CourseWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "iePOUIyLVpqD7Ui2YkIHTt/qGwO/WvTT5GLCNDoCbBRFXOCNhzaE72IuH7/SaMZm",
  render_errors: [view: CourseWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Course.PubSub,
  live_view: [signing_salt: "MY1O/UTN"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
