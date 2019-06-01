defmodule KaypiApiWeb.TwilioController do
  use KaypiApiWeb, :controller

  def llamar(conn, _params) do
    token =
      ExTwilio.Capability.new
      |> ExTwilio.Capability.allow_client_outgoing("AP1576c95c9224426e8b64b2259ca72dc3")
      |> ExTwilio.Capability.token

    conn
    |> render("llamar.json", token: token)
  end

  def receive(conn, _params) do
    %{id: id} = KaypiApi.Accounts.GuardianSerializer.Plug.current_resource(conn)
    token =
      ExTwilio.Capability.new
      |> ExTwilio.Capability.allow_client_incoming(id |> Integer.to_string())
      |> ExTwilio.Capability.token

    conn
    |> render("receive.json", token: token)
  end

  # def dial(conn, _params) do
  #   resp = KaypiApi.Twiml.dial_albert
  #   conn
  #   |> put_resp_content_type("text/xml")
  #   |> text(resp)
  # end

end
