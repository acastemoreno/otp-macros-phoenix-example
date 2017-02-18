defmodule Server.Plug do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/holi" do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "Holi Woli")
  end

  match _ do
    send_resp(conn, 404, "Not Found")
  end
end
