defmodule Playout.NodeControllerTest do
  use Playout.ConnCase
  use ExUnit.Case, async: true

  @tag controller: true, api: true
  test "GET /api/nodes", %{ conn: conn } do
    response = get( conn, "/api/nodes" )
    assert response.status == 200
    assert response.resp_body == "[\"service:exslp://node@192.168.178.22,65535\"]"
  end

end

