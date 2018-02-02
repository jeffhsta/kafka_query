defmodule KafkaQueryWeb.Router do
  use KafkaQueryWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", KafkaQueryWeb do
    pipe_through(:api)

    get("/messages", MessageController, :index)
    get("/topics/:topic/messages", MessageController, :get_by_topic)
  end
end
