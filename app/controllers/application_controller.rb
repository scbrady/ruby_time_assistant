class ApplicationController < ActionController::API
  include Response
  include Request
  include ExceptionHandler

  # before_action :authorize_request

  attr_reader :current_user

  def authorize_request
    begin
      @current_user ||= User.find(session[:user_id])
    rescue Exception # Try to make this more specific
      raise(ExceptionHandler::AuthenticationError, "#{Message.unauthorized}")
    end
  end
end
