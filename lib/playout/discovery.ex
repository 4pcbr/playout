defmodule Playout.Discovery do

  alias ExSlp.Service

  if Mix.env == :dev do
    @slp_args [ u: "127.0.0.1" ]
  else
    @slp_args []
  end

  def discover do
    case Service.registered?( @slp_args, [] ) do
      false ->
        { :ok, _ } = Service.register
      _ -> nil
    end
    Service.discover( @slp_args, [] )
      |> ensure_connnected
    :timer.sleep( 10000 )
    discover
  end

  def start_link do
    pid = spawn_link( __MODULE__, :discover, [] )
    { :ok, pid }
  end

  defp ensure_connnected( services ) do
    service_map = services
      |> Enum.map( fn service ->
        { service, true }
      end ) |> Enum.into(%{})
    IO.inspect service_map
  end

end
