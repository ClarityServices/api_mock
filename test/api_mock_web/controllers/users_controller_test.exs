defmodule ApiMockWeb.UsersControllerTest do
  use ApiMockWeb.ConnCase

  alias ApiMock.Crew
  alias ApiMock.Crew.Users

  @create_attrs %{name: "Bender", position: "Ship's Cook", company: "Planet Express", profile: %{}}
  @update_attrs %{name: "Bender", position: "Ship's Cook", company: "Planet Express", profile: %{}}
  @invalid_attrs %{name: nil, position: nil, company: nil}

  def fixture(:users) do
    {:ok, users} = Crew.create_users(@create_attrs)
    users
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all users", %{conn: conn} do
      conn = get conn, users_path(conn, :index)
      assert json_response(conn, 200)["users"] == []
    end
  end

  describe "create users" do
    test "renders users when data is valid", %{conn: conn} do
      conn = post conn, users_path(conn, :create), users: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["user"]

      conn = get conn, users_path(conn, :show, id)
      assert json_response(conn, 200)["user"] == %{
        "id" => id,
        "name" => "Bender",
        "company" => "Planet Express",
        "position" => "Ship's Cook",
        "profile" => %{}}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, users_path(conn, :create), users: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update users" do
    setup [:create_users]

    test "renders users when data is valid", %{conn: conn, users: %Users{id: id} = users} do
      conn = put conn, users_path(conn, :update, users), users: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["user"]

      conn = get conn, users_path(conn, :show, id)
      assert json_response(conn, 200)["user"] == %{
        "id" => id,
        "name" => "Bender",
        "company" => "Planet Express",
        "position" => "Ship's Cook",
        "profile" => %{}}
    end

    test "renders errors when data is invalid", %{conn: conn, users: users} do
      conn = put conn, users_path(conn, :update, users), users: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete users" do
    setup [:create_users]

    test "deletes chosen users", %{conn: conn, users: users} do
      conn = delete conn, users_path(conn, :delete, users)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, users_path(conn, :show, users)
      end
    end
  end

  defp create_users(_) do
    users = fixture(:users)
    {:ok, users: users}
  end
end
