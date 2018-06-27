defmodule ApiMock.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :profile, :map
      add :name, :string
      add :position, :string
      add :company, :string

      timestamps()
    end

  end
end
