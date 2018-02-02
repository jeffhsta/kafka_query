defmodule KafkaQueryWeb.MessageController do
  use KafkaQueryWeb, :controller
  alias KafkaQuery.Fetcher

  def index(conn, %{"key" => key}) do
    messages = Fetcher.query_by_key(key)

    conn
    |> put_status(:ok)
    |> render(messages: messages)
  end

  def index(conn, _params) do
    messages = Fetcher.all()

    conn
    |> put_status(:ok)
    |> render(messages: messages)
  end

  def get_by_topic(conn, %{"topic" => topic}) do
    messages = Fetcher.query_by_topic(topic)

    conn
    |> put_status(:ok)
    |> render("index.json", messages: messages)
  end
end
