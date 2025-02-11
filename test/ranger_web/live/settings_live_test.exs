defmodule RangerWeb.SettingsLiveTest do
  use RangerWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  alias RangerWeb.SettingsLive.EditableInputComponent
  alias Ranger.{Repo, User}

  test "renders user information", %{conn: conn} do
    # * in this test we are ensuring that user details are rendered
    # * we do not actually care whether a live component is being used or not
    user = create_user()
    user_id = user.id

    {:ok, _view, html} = live(conn, "/users/#{user_id}/settings")

    assert html =~ user.name
    assert html =~ user.email
  end

  test "testing state and form submission", %{conn: conn} do
    user = create_user(%{name: "Marion Kinyua", email: "ephantusmarion@gmail.com"})

    user_id = user.id

    {:ok, view, html} = live(conn, "/users/#{user_id}/settings")

    element(view, "#name") |> render_click()

    html =
      form(view, "#name-form", %{name: "Lucy Watiri"})
      |> render_submit()

    assert has_element?(view, "#name", "Lucy Watiri")

    assert has_element?(view, "#email", "ephantusmarion@gmail.com")
  end

  defp create_user(params \\ %{}) do
    %{email: "random2@example.com", name: "randomname2"}
    |> Map.merge(params)
    |> User.changeset()
    |> Repo.insert!()
  end
end
