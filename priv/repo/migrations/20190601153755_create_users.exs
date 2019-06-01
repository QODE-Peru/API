defmodule KaypiApi.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :first_name, :string
      add :last_name, :string
      add :phone_number, :string
      add :document_number, :string
      add :birthday, :date
      add :user_type_id, references(:user_types, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:users, [:user_type_id])
  end
end
