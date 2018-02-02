defmodule KafkaQueryWeb.MessageView do
  use KafkaQueryWeb, :view

  def render("index.json", %{messages: messages}) do
    render_many(messages, __MODULE__, "show.json")
  end

  def render("show.json", %{message: message}) do
    %{
      index: message.index,
      key: message.key,
      value: message.value
    }
  end
end
