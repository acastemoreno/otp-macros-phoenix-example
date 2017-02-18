defmodule Server.Supervisor do
  use Supervisor

  ## Implementación API
  #####
  def start_link() do
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  ## Implementación Supervisor
  #####
  def init([]) do
    children = [
      worker(Server.Supervisor.Generic, [])
    ]

    supervise(children, strategy: :one_for_one)
  end
end
