defmodule ApiMock.CrewTest do
  use ApiMock.DataCase

  alias ApiMock.Crew

  describe "users" do
    alias ApiMock.Crew.Users

    test "list_users/0 returns all users" do
      assert Crew.list_users() == []
    end

  #   test "get_users!/1 returns the users with given id" do
  #     assert Crew.get_users!(1) == %{}
  #   end

  #   test "create_users/1 with valid data creates a users" do
  #     assert {:ok, %Users{} = users} = Crew.create_users(@valid_attrs)
  #     assert users.profile == %{}
  #   end

  #   test "create_users/1 with invalid data returns error changeset" do
  #     assert {:error, %Ecto.Changeset{}} = Crew.create_users(@invalid_attrs)
  #   end

  #   test "update_users/2 with valid data updates the users" do
  #     users = users_fixture()
  #     assert {:ok, users} = Crew.update_users(users, @update_attrs)
  #     assert %Users{} = users
  #     assert users.profile == %{}
  #   end

  #   test "update_users/2 with invalid data returns error changeset" do
  #     users = users_fixture()
  #     assert {:error, %Ecto.Changeset{}} = Crew.update_users(users, @invalid_attrs)
  #     assert users == Crew.get_users!(users.id)
  #   end

  #   test "delete_users/1 deletes the users" do
  #     users = users_fixture()
  #     assert {:ok, %Users{}} = Crew.delete_users(users)
  #     assert_raise Ecto.NoResultsError, fn -> Crew.get_users!(users.id) end
  #   end

  #   test "change_users/1 returns a users changeset" do
  #     users = users_fixture()
  #     assert %Ecto.Changeset{} = Crew.change_users(users)
  #   end
  end
end
