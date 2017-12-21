class AlexaController < ApplicationController

  def conversation
    alexa = AlexaRuby.new(alexa_params(params))
    alexa.response.tell("What's up, yo?")

    json_response alexa.response.json
  end
end
