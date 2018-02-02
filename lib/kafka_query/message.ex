defmodule KafkaQuery.Message do
  defstruct([:key, :value, :index, :crc, :partition, :topic])
end
