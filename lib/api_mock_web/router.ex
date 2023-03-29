defmodule ApiMockWeb.Router do
  use ApiMockWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ApiMockWeb do
    pipe_through :api
    resources "/users", UsersController, only: [:index, :show]
  end
end
