defmodule RangerWeb.GreetLiveTest do
  use RangerWeb.ConnCase

  import Phoenix.LiveViewTest

  # * test/3 -> test name, the testing context, the contents of the test

  test "initial request", %{conn: conn} do
    disconnected = get(conn, ~p"/greet")

    assert html_response(disconnected, 200) =~ "Welcome to stateless HTTP"
  end

  test "upgrade request", %{conn: conn} do
    {:ok, _view, html} = live(conn, "/greet")
    assert html =~ "Welcome to Testing LiveView"
  end
end
