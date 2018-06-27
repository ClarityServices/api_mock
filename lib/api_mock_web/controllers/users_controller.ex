defmodule ApiMockWeb.UsersController do
  use ApiMockWeb, :controller

  alias ApiMock.Crew
  alias ApiMock.Crew.Users

  action_fallback ApiMockWeb.FallbackController

  def index(conn, _params) do
    users = Crew.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"users" => users_params}) do
    with {:ok, %Users{} = users} <- Crew.create_users(users_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", users_path(conn, :show, users))
      |> render("show.json", users: users)
    end
  end

  def show(conn, %{"id" => id}) do
    users = Crew.get_users!(id)
    render(conn, "show.json", users: users)
  end

  def update(conn, %{"id" => id, "users" => users_params}) do
    users = Crew.get_users!(id)

    with {:ok, %Users{} = users} <- Crew.update_users(users, users_params) do
      render(conn, "show.json", users: users)
    end
  end

  def delete(conn, %{"id" => id}) do
    users = Crew.get_users!(id)
    with {:ok, %Users{}} <- Crew.delete_users(users) do
      send_resp(conn, :no_content, "")
    end
  end
end
