defmodule Playout.NodeView do
  use Playout.Web, :view

  def render( "index.json", %{ nodes: nodes } ) do
    nodes
  end

end
