import Config

if config_env() == :prod do
  config :logger,
    level: "LOG_LEVEL" |> System.get_env("info") |> String.downcase() |> String.to_atom()

  config :logger, :console,
    format: "$time $metadata[$level] $message\n",
    metadata: [:request_id]

  config :kafka_ex,
    brokers: System.fetch_env!("KAFKA_HOSTS"),
    consumer_group: "kafka-query",
    client_id: "kafka-query",
    disable_default_worker: false,
    use_ssl: System.get_env("KAFKA_USE_SSL") == "TRUE"
end
