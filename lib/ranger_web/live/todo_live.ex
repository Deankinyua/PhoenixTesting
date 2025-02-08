defmodule RangerWeb.TodoLive do
  use RangerWeb, :live_view

  alias Ranger.Repo
  alias Ranger.Todo

  def render(assigns) do
    # * Here we have purposefully used a data-* attribute as a selector
    # * It can also be used for storing some data on the client
    ~H"""
    <ul id="todos" phx-update="stream">
      <%= for {todo_id, todo} <- @streams.todos do %>
        <li id={todo_id} data-role="todo"><%= todo.body %></li>
      <% end %>
    </ul>

    <.simple_form :let={f} for={@changeset} phx-submit="create" id="add-todo">
      <.input field={{f, :body}} />

      <:actions>
        <.button>Create</.button>
      </:actions>
    </.simple_form>
    """
  end

  def mount(_, _, socket) do
    changeset = Todo.changeset(%{})
    todos = Todo |> Repo.all()

    # * just for fun :) playing with Map.from_struct()ß

    # todos =
    #   Todo
    #   |> Repo.get(1)
    #   |> Map.from_struct()
    #   |> List.wrap()

    {
      :ok,
      socket
      |> assign(:changeset, changeset)
      |> stream(:todos, todos)
    }
  end

  def handle_event("create", %{"todo" => params}, socket) do
    case create_todo(params) do
      {:ok, todo} ->
        {:noreply, stream_insert(socket, :todos, todo)}

      {:error, changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp create_todo(params) do
    params
    |> Todo.changeset()
    |> Repo.insert()
  end
end
