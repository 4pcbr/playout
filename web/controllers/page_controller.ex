defmodule Playout.PageController do
  use Playout.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
