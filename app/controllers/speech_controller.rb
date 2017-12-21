class SpeechController < ApplicationController

  def index
    json_response(message: 'authed')
  end

  def conversation
    assistant_response = GoogleAssistant.respond_to(params, response) do |assistant|
      assistant.intent.main do
        assistant.ask(
            "<speak>Hi there! Say something, please.</speak>",            # The voice prompt the user will hear.
            [
                "<speak>If you said something, I didn't hear you.</speak>", # You can provide a number of "no input prompts". A random
                "<speak>Did you say something?</speak>"                     # one will be spoken if the user takes too long to respond.
            ]
        )
      end

      assistant.intent.text do
        assistant.tell("<speak>Thanks for talking! Goodbye!</speak>")   # Both SSML and plain text work here and anywhere you send a prompt.
      end
    end

    json_response assistant_response
  end
end
