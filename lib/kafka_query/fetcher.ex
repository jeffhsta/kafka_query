defmodule KafkaQuery.Fetcher do
  alias KafkaQuery.Message

  @topics Application.get_env(:kafka_query, :topics)

  def all, do: Enum.flat_map(@topics, &query_by_topic/1)

  def query_by_key(key) do
    @topics
    |> Enum.flat_map(&query_by_topic/1)
    |> Enum.filter(fn msg -> msg.key == key end)
  end

  def query_by_topic(topic) when topic in @topics do
    topic
    |> get_number_partitions()
    |> (fn num -> 0..(num - 1) end).()
    |> Enum.flat_map(&fetch(topic, &1))
  end

  def query_by_topic(_topic), do: []

  defp fetch(topic, partition) do
    topic
    |> KafkaEx.fetch(partition, offset: 0)
    |> List.first()
    |> Map.get(:partitions)
    |> List.first()
    |> Map.get(:message_set)
    |> Enum.map(fn msg ->
      %Message{
        key: msg.key,
        value: decode_value(msg.value),
        index: msg.offset,
        crc: msg.crc,
        partition: partition,
        topic: topic
      }
    end)
  end

  defp decode_value(value) do
    case Jason.decode(value) do
      {:ok, decoded_value} -> decoded_value
      _ -> value
     end
  end

  defp get_number_partitions(topic) do
    [topic: topic]
    |> KafkaEx.metadata()
    |> Map.get(:topic_metadatas)
    |> List.first()
    |> Map.get(:partition_metadatas)
    |> Enum.count()
  end
end
