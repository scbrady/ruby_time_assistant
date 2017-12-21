module Request
  def alexa_params(params)
    params[:context][:System][:device][:deviceId] = 'test' unless params.dig(:context,:System,:device,:deviceId)
    params.to_json
  end
end