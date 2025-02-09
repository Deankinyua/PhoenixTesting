defmodule Ranger.FellowshipMember do
  alias Ranger.FellowshipMember
  defstruct [:name, :type, :description]

  def new(name, type, description) do
    %FellowshipMember{
      name: name,
      type: type,
      description: description
    }
  end
end
