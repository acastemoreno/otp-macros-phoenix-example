defmodule Amiguitos.PageController do
  use Amiguitos.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
