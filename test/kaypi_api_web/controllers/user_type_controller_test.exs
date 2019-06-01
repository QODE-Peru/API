defmodule KaypiApiWeb.UserTypeControllerTest do
  use KaypiApiWeb.ConnCase

  alias KaypiApi.Accounts
  alias KaypiApi.Accounts.UserType

  @create_attrs %{
    name: "some name"
  }
  @update_attrs %{
    name: "some updated name"
  }
  @invalid_attrs %{name: nil}

  def fixture(:user_type) do
    {:ok, user_type} = Accounts.create_user_type(@create_attrs)
    user_type
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all user_types", %{conn: conn} do
      conn = get(conn, Routes.user_type_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create user_type" do
    test "renders user_type when data is valid", %{conn: conn} do
      conn = post(conn, Routes.user_type_path(conn, :create), user_type: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.user_type_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.user_type_path(conn, :create), user_type: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update user_type" do
    setup [:create_user_type]

    test "renders user_type when data is valid", %{conn: conn, user_type: %UserType{id: id} = user_type} do
      conn = put(conn, Routes.user_type_path(conn, :update, user_type), user_type: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.user_type_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, user_type: user_type} do
      conn = put(conn, Routes.user_type_path(conn, :update, user_type), user_type: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete user_type" do
    setup [:create_user_type]

    test "deletes chosen user_type", %{conn: conn, user_type: user_type} do
      conn = delete(conn, Routes.user_type_path(conn, :delete, user_type))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.user_type_path(conn, :show, user_type))
      end
    end
  end

  defp create_user_type(_) do
    user_type = fixture(:user_type)
    {:ok, user_type: user_type}
  end
end
