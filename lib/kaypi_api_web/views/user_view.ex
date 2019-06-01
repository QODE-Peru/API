defmodule KaypiApiWeb.UserView do
  use KaypiApiWeb, :view
  alias KaypiApiWeb.{UserView, CredentialView}

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      first_name: user.first_name,
      last_name: user.last_name,
      phone_number: user.phone_number,
      document_number: user.document_number,
      birthday: user.birthday,
      #credential: render_one(user.credential, CredentialView)
    }
  end
end
