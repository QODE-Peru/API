defmodule KaypiApiWeb.TwilioView do
  use KaypiApiWeb, :view
  alias __MODULE__

  def render("receive.json", %{token: token}) do
    %{data: render_one(token, TwilioView, "receive-token.json")}
  end

  def render("llamar.json", %{token: token}) do
    %{data: render_one(token, TwilioView, "llamar-token.json")}
  end

  def render("token.json", %{token: token}) do
    %{data: render_one(token, TwilioView, "twilio-token.json")}
  end

  def render("receive-token.json", %{twilio: token}) do
    %{"receive-token" => token}
  end

  def render("llamar-token.json", %{twilio: token}) do
    %{"llamar-token" => token}
  end

  def render("twilio-token.json", %{twilio: token}) do
    %{"twilio-token" => token}
  end

end
