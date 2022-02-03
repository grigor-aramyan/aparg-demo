defmodule ApargWeb.PageController do
  use ApargWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
