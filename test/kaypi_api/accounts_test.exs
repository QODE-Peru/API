defmodule KaypiApi.AccountsTest do
  use KaypiApi.DataCase

  alias KaypiApi.Accounts

  describe "user_types" do
    alias KaypiApi.Accounts.UserType

    @valid_attrs %{name: "some name", users: []}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def user_type_fixture(attrs \\ %{}) do
      {:ok, user_type} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user_type()

      user_type
    end

    test "list_user_types/0 returns all user_types" do
      user_type = user_type_fixture()
      assert Accounts.list_user_types() == [user_type]
    end

    test "get_user_type!/1 returns the user_type with given id" do
      user_type = user_type_fixture()
      assert Accounts.get_user_type!(user_type.id) == user_type
    end

    test "create_user_type/1 with valid data creates a user_type" do
      assert {:ok, %UserType{} = user_type} = Accounts.create_user_type(@valid_attrs)
      assert user_type.name == "some name"
    end

    test "create_user_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user_type(@invalid_attrs)
    end

    test "update_user_type/2 with valid data updates the user_type" do
      user_type = user_type_fixture()
      assert {:ok, %UserType{} = user_type} = Accounts.update_user_type(user_type, @update_attrs)
      assert user_type.name == "some updated name"
    end

    test "update_user_type/2 with invalid data returns error changeset" do
      user_type = user_type_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user_type(user_type, @invalid_attrs)
      assert user_type == Accounts.get_user_type!(user_type.id)
    end

    test "delete_user_type/1 deletes the user_type" do
      user_type = user_type_fixture()
      assert {:ok, %UserType{}} = Accounts.delete_user_type(user_type)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user_type!(user_type.id) end
    end

    test "change_user_type/1 returns a user_type changeset" do
      user_type = user_type_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user_type(user_type)
    end
  end

  describe "users" do
    alias KaypiApi.Accounts.User

    @valid_attrs %{birthday: ~D[2010-04-17], document_number: "some document_number", first_name: "some first_name", last_name: "some last_name", phone_number: "some phone_number"}
    @update_attrs %{birthday: ~D[2011-05-18], document_number: "some updated document_number", first_name: "some updated first_name", last_name: "some updated last_name", phone_number: "some updated phone_number"}
    @invalid_attrs %{birthday: nil, document_number: nil, first_name: nil, last_name: nil, phone_number: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.birthday == ~D[2010-04-17]
      assert user.document_number == "some document_number"
      assert user.first_name == "some first_name"
      assert user.last_name == "some last_name"
      assert user.phone_number == "some phone_number"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Accounts.update_user(user, @update_attrs)
      assert user.birthday == ~D[2011-05-18]
      assert user.document_number == "some updated document_number"
      assert user.first_name == "some updated first_name"
      assert user.last_name == "some updated last_name"
      assert user.phone_number == "some updated phone_number"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "credentials" do
    alias KaypiApi.Accounts.Credential

    @valid_attrs %{email: "some email"}
    @update_attrs %{email: "some updated email"}
    @invalid_attrs %{email: nil}

    def credential_fixture(attrs \\ %{}) do
      {:ok, credential} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_credential()

      credential
    end

    test "list_credentials/0 returns all credentials" do
      credential = credential_fixture()
      assert Accounts.list_credentials() == [credential]
    end

    test "get_credential!/1 returns the credential with given id" do
      credential = credential_fixture()
      assert Accounts.get_credential!(credential.id) == credential
    end

    test "create_credential/1 with valid data creates a credential" do
      assert {:ok, %Credential{} = credential} = Accounts.create_credential(@valid_attrs)
      assert credential.email == "some email"
    end

    test "create_credential/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_credential(@invalid_attrs)
    end

    test "update_credential/2 with valid data updates the credential" do
      credential = credential_fixture()
      assert {:ok, %Credential{} = credential} = Accounts.update_credential(credential, @update_attrs)
      assert credential.email == "some updated email"
    end

    test "update_credential/2 with invalid data returns error changeset" do
      credential = credential_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_credential(credential, @invalid_attrs)
      assert credential == Accounts.get_credential!(credential.id)
    end

    test "delete_credential/1 deletes the credential" do
      credential = credential_fixture()
      assert {:ok, %Credential{}} = Accounts.delete_credential(credential)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_credential!(credential.id) end
    end

    test "change_credential/1 returns a credential changeset" do
      credential = credential_fixture()
      assert %Ecto.Changeset{} = Accounts.change_credential(credential)
    end
  end
end
