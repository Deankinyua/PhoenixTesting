defmodule RangerWeb.AboutComponentsTest do
  # ? the async: true enables tests in different modules to run concurrently
  # ? tests in the same module always run sequentially
  use ExUnit.Case, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  import RangerWeb.AboutComponents

  # describes a bunch of tests together

  describe "badge" do
    test "testing badge component" do
      component = render_component(&badge/1, type: "hobbit")

      assert component =~ "hobbit"
    end
  end
end
