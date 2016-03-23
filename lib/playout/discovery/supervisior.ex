defmodule Playout.Discovery.Supervisor do

  use Supervisor

  def start_link do
    res = { :ok, pid } = Supervisor.start_link( __MODULE__, [] )
    start_workers( pid )
    res
  end

  def start_workers( sup ) do
    Supervisor.start_child( sup, worker( Playout.Discovery, [] ) )
    Supervisor.start_child( sup, worker( Playout.Discovery.Discovered, [[]] ) )
  end

  def init(_) do
    supervise [], strategy: :one_for_one
  end

end
