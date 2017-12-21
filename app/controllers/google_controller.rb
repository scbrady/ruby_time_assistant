class GoogleController < ApplicationController

  def index
    json_response(message: 'authed')
  end

  def conversation
    params2 = params["originalRequest"]["data"]

    assistant_response = GoogleAssistant.respond_to(params2, response) do |assistant|
      assistant.intent.main do
        assistant.ask(
            "<speak>Hi there! Say something, please.</speak>",
            [
                "<speak>If you said something, I didn't hear you.</speak>",
                "<speak>Did you say something?</speak>"
            ]
        )
      end

      assistant.intent.text do
        assistant.tell("<speak>I can respond, too!</speak>")
      end
    end

    json_response assistant_response
  end
end
