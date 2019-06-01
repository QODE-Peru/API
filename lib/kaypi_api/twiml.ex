defmodule KaypiApi.Twiml do
  import ExTwiml

  def dial do
    twiml do
      # Twilio Number or verified Caller ID
      dial callerid: "+5117071809" do
        client "1"
      end
    end
  end
end
