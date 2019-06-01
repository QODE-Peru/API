defmodule KaypiApi.Accounts.Credential do
  use Ecto.Schema
  import Ecto.Changeset
  alias KaypiApi.Accounts.User

  schema "credentials" do
    field :email, :string
    field :encrypted_password, :string
    field :password, :string, virtual: true
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(credential, attrs) do
    credential
    |> cast(attrs, [:email, :password])
    |> validate_required([:email, :password])
    |> unique_constraint(:email)
    |> hash_password()
  end

  defp hash_password(changeset = %Ecto.Changeset{changes: %{password: pass}, errors: []}) do
    changeset = put_change(changeset, :encrypted_password, Comeonin.Argon2.hashpwsalt(pass))
    IO.inspect(changeset)
    changeset
  end

  defp hash_password(changeset) do
    changeset
  end
end
