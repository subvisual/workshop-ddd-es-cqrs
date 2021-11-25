# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of the Config module.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
import Config

config :portal,
  generators: [context_app: false]

# Configures the endpoint
config :portal, Portal.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: Portal.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Portal.PubSub,
  live_view: [signing_salt: "bogBI+Kh"]

config :portal,
  ecto_repos: [Portal.Repo],
  generators: [context_app: false]

# Configures the endpoint
config :portal, Portal.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: Portal.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Portal.PubSub,
  live_view: [signing_salt: "0iigfOGj"]

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.12.18",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2016 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../apps/portal/assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Sample configuration:
#
#     config :logger, :console,
#       level: :info,
#       format: "$date $time [$level] $metadata$message\n",
#       metadata: [:user_id]
#
# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :ppr,
  event_stores: [PPR.EventStore],
  ecto_repos: [PPR.Repo]

config :ppr, PPR.Repo, migration_source: "ecto_migrations"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
