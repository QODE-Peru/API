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
  def changeset_create(credential, attrs) do
    credential
    |> changeset(attrs)
    |> hash_password()
  end

  def changeset_session(credential, attrs) do
    credential
    |> changeset(attrs)
    |> validate_password()
  end

  @doc false
  def changeset(credential, attrs) do
    credential
    |> cast(attrs, [:email, :password])
    |> validate_required([:email, :password])
    |> unique_constraint(:email)
    |> validate_length(:password, min: 6)
  end

  def hash_password(changeset = %Ecto.Changeset{changes: %{password: password}, errors: []}) do
    put_change(changeset, :encrypted_password, Argon2.hash_pwd_salt(password))
  end

  def hash_password(changeset) do
    changeset
  end

  def validate_password(changeset = %Ecto.Changeset{changes: %{password: password}, data: %{encrypted_password: encrypted_password}, errors: []}) do
    case Argon2.verify_pass(password, encrypted_password) do
      true -> {:ok, changeset}
      false -> {:error, changeset |> add_error(:password, "Contraseña incorrecta")}
    end
  end

  def validate_password(changeset) do
    {:error, changeset}
  end
end
