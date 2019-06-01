defmodule KaypiApi.Pipeline.Auth do
  use Guardian.Plug.Pipeline, otp_app: :kaypi_api

  plug Guardian.Plug.VerifySession
  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource, allow_blank: true
end
