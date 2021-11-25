import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :portal, Portal.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "PF6bqzI29nYZWL91YXQvVJxhA/zlWpOPeAQHfpYz++LDrA0FpaLIoxaF2le7mhE+",
  server: false

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :portal, Portal.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "GShGtljIKzhGXDgdJy771YuQw8xQTfhREAoJxT4Mu7m5w6H3CbopgfFPH7iff+CM",
  server: false
