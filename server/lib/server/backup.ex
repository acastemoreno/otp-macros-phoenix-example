defmodule Server.Backup do
  use GenServer

  ## Implementación API
  #####
  def start_link(parametro) do
    GenServer.start_link(__MODULE__, [parametro], name: __MODULE__)
  end

  ## Implementación GenServer
  #####

  def handle_call(:estado, _from, estado) do
    {:reply, estado, estado}
  end

  def handle_cast({:nuevo_estado, nuevo_estado}, _estado) do
    {:noreply, nuevo_estado}
  end
end
  
