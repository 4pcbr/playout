defmodule Playout.BundleController do
  use Playout.Web, :controller

  def index( conn, _params ) do
    bundles = Repo.all( Playout.Bundle )
    render conn, "index.html", bundles: bundles
  end

end
