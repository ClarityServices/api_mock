defmodule ApiMockWeb.UsersControllerTest do
  use ApiMockWeb.ConnCase

  alias ApiMock.Crew
  alias ApiMock.Crew.Users

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all users", %{conn: conn} do
      conn = get conn, users_path(conn, :index)
      assert Enum.count(json_response(conn, 200)["users"]) == Enum.count(ApiMock.Crew.list_users)
    end
  end

  describe "show" do
    test "show an existing user", %{conn: conn} do
      conn = get conn, users_path(conn, :show, "bad_id")
      assert json_response(conn, 404)["user"] == nil
    end
  end
end
