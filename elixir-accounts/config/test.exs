import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :accounts_graph, AccountsGraphWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "01QXSJhN2Vz75t03yi55R5X/aQmO/EFRvdJSw91WiCbTS+93aWRQwqbtpgStlLj9",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
