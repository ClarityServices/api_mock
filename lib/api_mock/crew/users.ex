defmodule ApiMock.Crew.Users do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :profile, :map
    field :name, :string
    field :position, :string
    field :company, :string

    timestamps()
  end

  @doc false
  def changeset(users, attrs) do
    users
    |> cast(attrs, [:profile, :name, :position, :company])
    |> validate_required([:name, :position, :company])
  end
end
