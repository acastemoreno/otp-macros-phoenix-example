defmodule Server.Supervisor.Generic do
  use GenServer

  ## Implementación API
  #####
  def start_link() do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def agregar_elemento(nuevo_elemento) do
    GenServer.cast(__MODULE__, {:agregar_elemento, nuevo_elemento})
  end

  def estado() do
    GenServer.call(__MODULE__, :estado)
  end

  def primer_elemento() do
    GenServer.call(__MODULE__, :primer_elemento)
  end

  def multiplicado(factor) do
    GenServer.call(__MODULE__, {:multiplicado, factor})
  end

  ## Implementación GenServer
  #####
  def init([]) do
    {:ok, GenServer.call(Server.Backup, :estado)}
  end

  def handle_cast({:agregar_elemento, nuevo_elemento}, estado) do
    {:noreply, [nuevo_elemento*1 | estado]}
  end

  def handle_call(:estado, _from, estado) do
    {:reply, estado, estado}
  end

  def handle_call(:primer_elemento, _from, []) do
    {:reply, "Qué paso amiguito?", []}
  end

  def handle_call(:primer_elemento, _from, [head | tail]) do
    {:reply, head, tail}
  end

  def handle_call({:multiplicado, factor}, _from, estado) do
    nuevo_estado = estado |> Enum.map(&(&1*factor))
    {:reply, nuevo_estado, nuevo_estado}
  end

  def terminate(_reason, estado) do
    GenServer.cast(Server.Backup, {:nuevo_estado, estado})
  end
end
