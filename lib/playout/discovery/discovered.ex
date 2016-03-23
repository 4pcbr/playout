defmodule Playout.Discovery.Discovered do

  use GenServer

  def start_link do
    { :ok, pid } = GenServer.start_link( __MODULE__, nil, name: __MODULE__ )
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

end
