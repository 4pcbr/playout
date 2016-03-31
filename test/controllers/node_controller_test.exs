defmodule Playout.NodeControllerTest do
  use Playout.ConnCase

  @tag controller: true, api: true
  test "GET /api/nodes", %{ conn: conn } do
    response = get( conn, "/api/nodes" )
    assert response.status == 200
    IO.inspect conn
  end

end

