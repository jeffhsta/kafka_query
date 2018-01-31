defmodule KafkaQuery.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    # Define workers and child supervisors to be supervised
    children = [
      supervisor(KafkaQueryWeb.Endpoint, [])
    ]

    opts = [strategy: :one_for_one, name: KafkaQuery.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    KafkaQueryWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
