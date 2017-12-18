class SpeechController < ApplicationController
  def index
    json_response(message: 'authed')
  end
end
