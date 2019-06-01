defmodule KaypiApiWeb.UserTypeController do
  use KaypiApiWeb, :controller

  alias KaypiApi.Accounts
  alias KaypiApi.Accounts.UserType

  action_fallback KaypiApiWeb.FallbackController

  def index(conn, _params) do
    user_types = Accounts.list_user_types()
    render(conn, "index.json", user_types: user_types)
  end

  def create(conn, %{"user_type" => user_type_params}) do
    with {:ok, %UserType{} = user_type} <- Accounts.create_user_type(user_type_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_type_path(conn, :show, user_type))
      |> render("show.json", user_type: user_type)
    end
  end

  def show(conn, %{"id" => id}) do
    user_type = Accounts.get_user_type!(id)
    render(conn, "show.json", user_type: user_type)
  end

  def update(conn, %{"id" => id, "user_type" => user_type_params}) do
    user_type = Accounts.get_user_type!(id)

    with {:ok, %UserType{} = user_type} <- Accounts.update_user_type(user_type, user_type_params) do
      render(conn, "show.json", user_type: user_type)
    end
  end

  def delete(conn, %{"id" => id}) do
    user_type = Accounts.get_user_type!(id)

    with {:ok, %UserType{}} <- Accounts.delete_user_type(user_type) do
      send_resp(conn, :no_content, "")
    end
  end
end
