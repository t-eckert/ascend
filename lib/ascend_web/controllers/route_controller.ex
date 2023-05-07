defmodule AscendWeb.RouteController do
  use AscendWeb, :controller

  def index(conn, _params) do
    text(conn, "Routes")
  end

  def show(conn, _params) do
    render(conn, :show)
  end
end
