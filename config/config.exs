use Mix.Config

config :kafka_query, KafkaQueryWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "LvMBoYf2YS3R8SQzQXi+tj9zaWRw7vJpqcihbehnGEgcUHFt7OUwEA+3k4SGp6O3",
  render_errors: [view: KafkaQueryWeb.ErrorView, accepts: ~w(json)],
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: []

config :phoenix, :stacktrace_depth, 20

config :kafka_query, topics: ["user", "camp", "logging"]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :kafka_ex,
  brokers: [{"127.0.0.1", 9092}],
  consumer_group: "kafka-query",
  disable_default_worker: false,
  sync_timeout: 3000,
  max_restarts: 10,
  max_seconds: 60,
  kafka_version: "0.9.0",
  use_ssl: false
