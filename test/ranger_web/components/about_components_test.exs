defmodule RangerWeb.AboutComponentsTest do
  # ? the async: true enables tests in different modules to run concurrently
  # ? tests in the same module always run sequentially
  use ExUnit.Case, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  import RangerWeb.AboutComponents

  # describes a bunch of tests together

  describe "badge" do
    # * The second way of using a HEEX template is the recommended one
    # * It is especially useful since sometimes we have slots etc
    test "renders content in badge (render_component)" do
      component = render_component(&badge/1, type: "hobbit")

      assert component =~ "hobbit"
    end

    test "renders content in badge (HEEX)" do
      # * Here we have used a heex template as a way to build a component
      # * In order to test we have to convert it into a string which is the work of render_to_string/1
      assigns = %{}

      component =
        rendered_to_string(~H"""
        <.badge type="hobbit" />
        """)

      assert component =~ "hobbit"
    end

    test "renders green color for hobbit" do
      assigns = %{}

      component =
        rendered_to_string(~H"""
        <.badge type="hobbit" />
        """)

      assert component =~ "bg-[#1ECBE1]"
    end
  end

  describe "card" do
    test "renders inner block and title slot" do
      assigns = %{}

      card =
        rendered_to_string(~H"""
        <.card>
          <:title>Hello World</:title>
          This is the body
        </.card>
        """)

      dbg(card)

      assert card =~ "This is the body"
    end
  end
end
