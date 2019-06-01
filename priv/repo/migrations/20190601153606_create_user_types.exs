defmodule KaypiApi.Repo.Migrations.CreateUserTypes do
  use Ecto.Migration

  def change do
    create table(:user_types) do
      add :name, :string

      timestamps()
    end

  end
end
