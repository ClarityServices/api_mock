defmodule ApiMockWeb.UsersController do
  use ApiMockWeb, :controller

  alias ApiMock.Crew
  alias ApiMock.Crew.Users

  action_fallback ApiMockWeb.FallbackController

  def index(conn, _params) do
    users = Crew.list_users()
    render(conn, "index.json", users: users)
  end

  def show(conn, %{"id" => id}) do
    with {:ok, user} <- Crew.get_users!(id) do
      conn
        |> render("show.json", users: user)
    end
  end
end
