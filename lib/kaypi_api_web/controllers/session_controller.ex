defmodule KaypiApiWeb.SessionController do
  use KaypiApiWeb, :controller

  alias KaypiApi.Accounts
  alias KaypiApi.Accounts.{User, GuardianSerializer}

  action_fallback KaypiApiWeb.FallbackController

  def create(conn, %{"credential" => credential_params = %{"email" => email}}) do
    credential = Accounts.get_credential_by_email!(email)

    with {:ok, %User{} = user} <- Accounts.find_user_by_credentials(credential, credential_params),
         {:ok, token, _claims} <- GuardianSerializer.encode_and_sign(user) do
      render(conn, "show.json", token: token)
    end

	end

end
