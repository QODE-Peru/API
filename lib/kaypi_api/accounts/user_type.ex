defmodule KaypiApi.Accounts.UserType do
  use Ecto.Schema
  import Ecto.Changeset
  alias KaypiApi.Accounts.User

  schema "user_types" do
    field :name, :string
    has_many :users, User

    timestamps()
  end

  @doc false
  def changeset(user_type, attrs) do
    user_type
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
