defmodule RangerWeb.NewsletterLiveTest do
  use RangerWeb.ConnCase

  import Phoenix.LiveViewTest

  test "simulate a form change event", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/newsletter")
    # in this case we try the test with an input that is invalid
    email = "kinyuadean"

    html = form(view, "#subscribe", %{subscription: %{email: email}}) |> render_change()

    assert html =~ "has invalid format"
  end
end
