defmodule RangerWeb.TodoLiveTest do
  use RangerWeb.ConnCase

  import Phoenix.LiveViewTest

  test "user can create a new todo", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/todo")

    # form(view, selector, form_data \\ %{})

    # Realize that a test always starts from a blank canvas unless
    # you specifically seed data in setup blocks at RangerWeb.ConnCase

    html = form(view, "#add-todo", %{todo: %{body: "Dean Kinyua"}}) |> render_submit()

    assert has_element?(view, "[data-role=todo]", "Dean Kinyua")

    # assert html =~ "Dean Kinyua"
  end
end
