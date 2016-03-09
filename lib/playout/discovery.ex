defmodule Playout.Discovery do

  alias ExSlp.Service

  def start_link do
    case Service.registered? do
      false ->
        { :ok, _ } = Service.register
      _ -> nil
    end
  end

end
