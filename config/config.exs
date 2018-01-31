use Mix.Config

config :kafka_query, ecto_repos: [KafkaQuery.Repo]

config :kafka_query, KafkaQueryWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "LvMBoYf2YS3R8SQzQXi+tj9zaWRw7vJpqcihbehnGEgcUHFt7OUwEA+3k4SGp6O3",
  render_errors: [view: KafkaQueryWeb.ErrorView, accepts: ~w(json)]

config :phoenix, :stacktrace_depth, 20

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :kafka_query, KafkaQueryWeb.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: []
