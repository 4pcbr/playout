defmodule Playout.Discovery do

  use GenServer

  alias ExSlp.Service

  if Mix.env == :test do
    @slp_args [ u: "127.0.0.1" ]
  else
    @slp_args []
  end

  def handle_info( :discover, state ) do
    case Service.registered?( @slp_args, [] ) do
      false ->
        { :ok, _ } = Service.register
      _ -> nil
    end
    Service.discover( @slp_args, [] )
      |> ensure_connnected
    Process.send_after( __MODULE__, :discover, 10000 )
    { :noreply, state }
  end

  def update( services ) do
    GenServer.cast( __MODULE__, { :update, services } )
  end

  def get_services do
    GenServer.call( __MODULE__, :get_services )
  end

  def handle_cast({ :update, services }, _state ) do
    # TODO: compare the sets and notify the observers
    { :noreply, :ordsets.from_list( services ) }
  end

  def handle_call( :get_services, _from, state ) do
    { :reply, state, state }
  end

  def handle_info({ :DOWN, _ref, :process, _pid, _reason }, state ) do
    Service.deregister
    { :noreply, state }
  end

  def terminate( _reason, state ) do
    Service.deregister
  end

  def start_link( state ) do
    res = { :ok, _ } = GenServer.start_link( __MODULE__, state, name: __MODULE__ )
    Process.send( __MODULE__, :discover, [] )
    res
  end

  defp ensure_connnected( services ) do
    service_map = services
      |> Enum.map( fn service ->
        { service, true }
      end ) |> Enum.into(%{})
    IO.inspect service_map
  end

end
