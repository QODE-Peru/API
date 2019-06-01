defmodule KaypiApiWeb.TwilioView do
  use KaypiApiWeb, :view
  alias __MODULE__

  def render("receive.json", %{token: token}) do
    %{data: render_one(token, TwilioView, "token.json")}
  end

  def render("token.json", data) do
    %{"receive-token" => data}
  end

end
