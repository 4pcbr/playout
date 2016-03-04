defmodule Playout.BundleController do
  use Playout.Web, :controller
  alias Playout.Bundle

  def index( conn, _params ) do
    bundles = Repo.all( Playout.Bundle )
    render conn, "index.html", bundles: bundles
  end

  def new( conn, _params ) do
    changeset = Bundle.changeset( %Bundle{} )
    render conn, "new.html", changeset: changeset
  end

  def create( conn, %{ "bundle" => bundle_params } ) do
    changeset = Bundle.changeset( %Bundle{}, bundle_params )
    case Repo.insert( changeset ) do
      { :ok, bundle } ->
        conn
          |> put_flash( :info, "#{bundle.name} created" )
          |> redirect( to: bundle_path( conn, :index ) )
      { :error, changeset } ->
        render( conn, "new.html", changeset: changeset )
    end
  end

end
