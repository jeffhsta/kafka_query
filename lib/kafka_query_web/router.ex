defmodule KafkaQueryWeb.Router do
  use KafkaQueryWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", KafkaQueryWeb do
    pipe_through :api
  end
end
