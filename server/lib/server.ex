defmodule Server do
  use Application

  def start(_type, _args) do
    Server.Backup.start_link(1000)
    Server.Supervisor.start_link
    Plug.Adapters.Cowboy.http Server.Plug, []
  end
end
