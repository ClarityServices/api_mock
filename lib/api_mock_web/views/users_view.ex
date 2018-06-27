defmodule ApiMockWeb.UsersView do
  use ApiMockWeb, :view
  alias ApiMockWeb.UsersView

  def render("index.json", %{users: users}) do
    %{users: render_many(users, UsersView, "users.json")}
  end

  def render("show.json", %{users: users}) do
    %{user: render_one(users, UsersView, "users.json")}
  end

  def render("users.json", %{users: users}) do
    %{id: users.id,
      name: users.name,
      position: users.position,
      company: users.company,
      profile: users.profile}
  end
end
