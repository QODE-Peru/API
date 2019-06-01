defmodule KaypiApiWeb.PageController do
  use KaypiApiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
