defmodule RangerWeb.AvatarLiveTest do
  use RangerWeb.ConnCase

  import Phoenix.LiveViewTest
  alias Ranger.Gravatar

  test "generate image url with Gravatar", %{conn: conn} do
    email = "kinyuadean@gmail.com"
    image_url = Gravatar.generate(email)

    {:ok, view, _html} = live(conn, "/avatar/#{email}")

    # we are using the ~s sigil to generate an image that has a src of image_url
    # then creating an element from the view with element/3

    element = element(view, ~s(img[src*="#{image_url}"]))

    assert has_element?(element)
  end
end
