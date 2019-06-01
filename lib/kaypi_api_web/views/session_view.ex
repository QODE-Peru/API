defmodule KaypiApiWeb.SessionView do
  use KaypiApiWeb, :view
  alias KaypiApiWeb.SessionView


  def render("show.json", %{token: token}) do
    %{data: render_one(token, SessionView, "token.json")}
  end

  def render("token.json", %{session: data}) do
    IO.inspect data
    %{token: data
    }
  end
end
