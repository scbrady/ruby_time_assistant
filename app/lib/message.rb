class Message
  def self.not_found(record = 'record')
    "Sorry, #{record} not found."
  end

  def self.invalid_credentials
    'Invalid credentials'
  end

  def self.unauthorized
    'Unauthorized request'
  end

  def self.welcome
    'Howdy, boss!'
  end

  def self.goodbye
    'Ok, goodbye!'
  end
end