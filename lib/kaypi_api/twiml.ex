defmodule KaypiApiWeb.Twiml do
  import ExTwiml

  def dial_albert do
    twiml do
      # This should be your Twilio Number or verified Caller ID
      dial callerid: "+5117071809" do
        client "albert"
      end
    end
  end
end
