defmodule RangerWeb.CounterLiveTest do
  use RangerWeb.ConnCase

  import Phoenix.LiveViewTest

  test "test increment", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/counter")

    increment_button = element(view, "#increment")

    render_click(increment_button)
    open_browser(view)

    assert has_element?(view, "#count", "1")
  end

  # test "test decrement", %{conn: conn} do
  #   {:ok, view, _html} = live(conn, "/counter")

  #   decrement_button = element(view, "#decrement")

  #   render_click(decrement_button)

  #   assert has_element?(view, "#count", "-1")
  # end
end
