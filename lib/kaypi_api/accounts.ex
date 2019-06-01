defmodule KaypiApi.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias KaypiApi.Repo

  alias KaypiApi.Accounts.{User, UserType, Credential}

  @doc """
  Returns the list of user_types.

  ## Examples

      iex> list_user_types()
      [%UserType{}, ...]

  """
  def list_user_types do
    UserType
    |> Repo.all()
    |> Repo.preload(:users)
  end

  @doc """
  Gets a single user_type.

  Raises `Ecto.NoResultsError` if the User type does not exist.

  ## Examples

      iex> get_user_type!(123)
      %UserType{}

      iex> get_user_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user_type!(id), do: UserType |> Repo.get!(id) |> Repo.preload(:users)

  @doc """
  Creates a user_type.

  ## Examples

      iex> create_user_type(%{field: value})
      {:ok, %UserType{}}

      iex> create_user_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user_type(attrs \\ %{}) do
    %UserType{}
    |> UserType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user_type.

  ## Examples

      iex> update_user_type(user_type, %{field: new_value})
      {:ok, %UserType{}}

      iex> update_user_type(user_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user_type(%UserType{} = user_type, attrs) do
    user_type
    |> UserType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a UserType.

  ## Examples

      iex> delete_user_type(user_type)
      {:ok, %UserType{}}

      iex> delete_user_type(user_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user_type(%UserType{} = user_type) do
    Repo.delete(user_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user_type changes.

  ## Examples

      iex> change_user_type(user_type)
      %Ecto.Changeset{source: %UserType{}}

  """
  def change_user_type(%UserType{} = user_type) do
    UserType.changeset(user_type, %{})
  end

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    User
    |> Repo.all()
    |> Repo.preload(:credential)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id) do
    User
    |> Repo.get!(id)
    |> Repo.preload(:credential)
 end

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    UserType
    |> Repo.get_by(name: "normal")
    |> Ecto.build_assoc(:users)
    |> User.changeset(attrs)
    |> Ecto.Changeset.cast_assoc(:credential, with: &Credential.changeset_create/2, required: true)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Ecto.Changeset.cast_assoc(:credential, with: &Credential.changeset/2, required: true)
    |> Repo.update()
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end


  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end


  @doc """
  Returns the list of credentials.

  ## Examples

      iex> list_credentials()
      [%Credential{}, ...]

  """
  def list_credentials do
    Repo.all(Credential)
  end

  @doc """
  Gets a single credential.

  Raises `Ecto.NoResultsError` if the Credential does not exist.

  ## Examples

      iex> get_credential!(123)
      %Credential{}

      iex> get_credential!(456)
      ** (Ecto.NoResultsError)

  """
  def get_credential_by_email!(email), do: Repo.get_by!(Credential, email: email) |> Repo.preload(:user)
  def get_credential!(id), do: Repo.get!(Credential, id)

  @doc """
  Creates a credential.

  ## Examples

      iex> create_credential(%{field: value})
      {:ok, %Credential{}}

      iex> create_credential(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_credential(attrs \\ %{}) do
    %Credential{}
    |> Credential.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a credential.

  ## Examples

      iex> update_credential(credential, %{field: new_value})
      {:ok, %Credential{}}

      iex> update_credential(credential, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_credential(%Credential{} = credential, attrs) do
    credential
    |> Credential.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Credential.

  ## Examples

      iex> delete_credential(credential)
      {:ok, %Credential{}}

      iex> delete_credential(credential)
      {:error, %Ecto.Changeset{}}

  """
  def delete_credential(%Credential{} = credential) do
    Repo.delete(credential)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking credential changes.

  ## Examples

      iex> change_credential(credential)
      %Ecto.Changeset{source: %Credential{}}

  """
  def change_credential(%Credential{} = credential) do
    Credential.changeset(credential, %{})
  end

  def find_user_by_credentials(%Credential{} = credential, attrs) do
    credential
    |> Credential.changeset_session(attrs)
    |> return_user()
  end

  defp return_user({:error, changeset}) do
    {:error, changeset}
  end
  defp return_user({:ok, %Ecto.Changeset{data: %{user: user}}}) do
    {:ok, user}
  end
end
