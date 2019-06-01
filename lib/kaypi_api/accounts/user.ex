defmodule KaypiApi.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias KaypiApi.Accounts.{UserType, Credential}

  schema "users" do
    field :birthday, :date
    field :document_number, :string
    field :first_name, :string
    field :last_name, :string
    field :phone_number, :string
    belongs_to :user_type, UserType
    has_one :credential, Credential

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :phone_number, :document_number, :birthday])
    |> validate_required([:first_name, :last_name, :phone_number, :document_number, :birthday])
  end
end
