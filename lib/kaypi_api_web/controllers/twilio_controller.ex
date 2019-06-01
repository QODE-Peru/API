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

  def token(conn, _params) do
    %{id: id} = KaypiApi.Accounts.GuardianSerializer.Plug.current_resource(conn)
    token =
      ExTwilio.Capability.new
      |> ExTwilio.Capability.allow_client_outgoing("AP1576c95c9224426e8b64b2259ca72dc3")
      |> ExTwilio.Capability.allow_client_incoming(id |> Integer.to_string())
      |> ExTwilio.Capability.token

    conn
    |> render("token.json", token: token)
  end

  def dial(conn, params) do
    IO.inspect params
    resp = KaypiApi.Twiml.dial
    conn
    |> put_resp_content_type("text/xml")
    |> text(resp)
  end

  def demo_llamar(conn, _params) do
    token =
      ExTwilio.Capability.new
      |> ExTwilio.Capability.allow_client_outgoing("AP1576c95c9224426e8b64b2259ca72dc3")
      |> ExTwilio.Capability.allow_client_incoming("2")
      |> ExTwilio.Capability.token

    conn
    |> render("llamar.html", token: token)
  end

  def demo_recibir(conn, _params) do
    token =
      ExTwilio.Capability.new
      |> ExTwilio.Capability.allow_client_outgoing("AP1576c95c9224426e8b64b2259ca72dc3")
      |> ExTwilio.Capability.allow_client_incoming("1")
      |> ExTwilio.Capability.token

    conn
    |> render("recibir.html", token: token)
  end

end
