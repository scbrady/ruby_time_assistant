class AlexaController < ApplicationController
  def conversation
    alexa = AlexaRuby.new(alexa_params(params))

    begin
      resp = AlexaController.send(alexa.request.type, alexa)

      alexa.response.tell(resp) if resp.is_a? String
    rescue NoMethodError
      alexa.response.tell("Sorry, I don't know that one yet!")
    end

    json_response alexa.response.json
  end

  #
  # Private methods
  #
  private
  def self.welcome(alexa)
    Message.welcome
  end

  def self.intent(alexa)
    intent = alexa.request.intent_name.underscore
    input = self.slots_to_input(alexa.request.slots)

    Assistant.send(intent, input) {|message|
      alexa.response.ask(message)
      alexa.response.add_session_attribute('directives', 'blah')
    }
  end

  def self.session_ended(alexa)
    Message.goodbye
  end

  def self.slots_to_input(slots)
    input = {}
    slots.each {|s|
      input[s.name.to_sym] = s.value
    }

    return input
  end
end
