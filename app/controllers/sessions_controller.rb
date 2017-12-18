class SessionsController < ApplicationController
  skip_before_action :authorize_request, only: [:create, :destroy, :failure]

  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    json_response(user)
  end

  def destroy
    session[:user_id] = nil
    json_response(message: 'Logged out')
  end

  def failure
    json_response(message: 'Woof')
  end
end
