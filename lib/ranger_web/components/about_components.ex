defmodule RangerWeb.AboutComponents do
  use Phoenix.Component

  attr :type, :string,
    # * giving a predefined list means that the item should be one of these
    values: ["hobbit", "wizard", "human", "elf", "dwarf"],
    required: true

  def badge(assigns) do
    ~H"""
    <span class={["px-2 py-1 rounded-lg text-sm", colors_from_badge_type(@type)]}>
      <%= @type %>
    </span>
    """
  end

  defp colors_from_badge_type(type) do
    # * A rare case of when string keys are preferred in maps :)
    %{
      "hobbit" => "bg-[#1ECBE1] text-[#E1341E]",
      "human" => "bg-blue-700 text-blue-100",
      "dwarf" => "bg-yellow-700 text-yellow-100",
      "wizard" => "bg-[#19E632] text-[#E619CD]",
      "elf" => "bg-[#11E1EE] text-[#EE1E11]"
    }[type]
  end

  slot :title, required: true
  slot :inner_block, required: true

  def card(assigns) do
    ~H"""
    <div class="border-2 p-4 rounded-lg max-w-sm">
      <div class="text-sm border-b-1 mb-4 flex flex-row justify-between align-center">
        <%= render_slot(@title) %>
      </div>

      <div>
        <%= render_slot(@inner_block) %>
      </div>
    </div>
    """
  end
end
