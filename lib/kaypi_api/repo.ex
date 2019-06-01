defmodule KaypiApi.Repo do
  use Ecto.Repo,
    otp_app: :kaypi_api,
    adapter: Ecto.Adapters.Postgres
end
