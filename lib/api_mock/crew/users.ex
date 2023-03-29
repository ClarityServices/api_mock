defmodule ApiMock.Crew.Users do
  @moduledoc """
  This module defines the Users model that are part of the Crew.
  """
  use Ecto.Schema

  @primary_key {:id, :binary_id, autogenerate: false}

  schema "users" do
    field :profile, :map
    field :name, :string
    field :position, :string
    field :company, :string

    timestamps()
  end
end
