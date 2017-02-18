defmodule Amiguitos.PageController do
  use Amiguitos.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def saludo(conn, _params) do
    render conn, "saludo.html"
  end

  def saludo_nombre(conn, %{"nombre" => nombre2}) do
    render conn, "saludo_nombre.html", nombre3: nombre2
  end
end
