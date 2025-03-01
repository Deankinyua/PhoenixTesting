defmodule Ranger.Todo do
  use Ecto.Schema
  import Ecto.Changeset
  alias Ranger.Todo

  schema "todos" do
    field :body, :string

    timestamps()
  end

  @doc false
  def changeset(todo \\ %Todo{}, attrs) do
    todo
    |> cast(attrs, [:body])
    |> validate_required([:body])
  end
end
