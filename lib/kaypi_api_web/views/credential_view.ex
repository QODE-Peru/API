defmodule KaypiApiWeb.CredentialView do
  use KaypiApiWeb, :view
  alias KaypiApiWeb.CredentialView

  def render("index.json", %{credentials: credentials}) do
    %{data: render_many(credentials, CredentialView, "credential.json")}
  end

  def render("show.json", %{credential: credential}) do
    %{data: render_one(credential, CredentialView, "credential.json")}
  end

  def render("credential.json", %{credential: credential}) do
    %{id: credential.id,
      email: credential.email}
  end
end
