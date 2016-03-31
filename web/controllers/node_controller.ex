defmodule Playout.NodeController do
  use Playout.Web, :controller

  def index( conn, _params ) do
    nodes = Playout.Discovery.get_services
    render conn, nodes: nodes
  end

end

