defmodule RangerWeb.SettingsLive.EditableInputComponentTest do
  use RangerWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  alias RangerWeb.SettingsLive.EditableInputComponent

  describe "editable live component" do
    test "check if field renders inside live component" do
      user = %{id: 1, name: "Dean Kinyua", email: "kinyuadean@gmail.com"}

      live_component =
        render_component(EditableInputComponent, id: "name", user: user, field: :name)

      assert live_component =~ "Dean Kinyua"
    end
  end
end
