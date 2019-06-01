defmodule KaypiApi.Repo.Migrations.UpdateCredentialPassword do
  use Ecto.Migration

  def change do
    alter table(:credentials) do
      add :encrypted_password, :string
    end
  end
end
