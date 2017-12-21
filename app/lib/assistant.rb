class Assistant
  def self.new_client(params)
    Client.create!(params)
    "Donezo, created #{params[:name]}"
  end

  def self.update_client(params)
    self.set_client(params[:old_name])
    @client.update(filter_params(params))
    "Donezo, updated #{@client.name}"
  end

  #
  # Private methods
  #
  private

  def self.set_client(name)
    @client = Client.find_by(name: name)
    raise "Sorry, I couldn't find that client." if @client == nil
  end

  def self.set_project(name)
    @project = Project.find_by(name: name)
    raise "Sorry, I couldn't find that project." if @project == nil
  end

  def self.filter_params(params)
    params.select do |key, value|
      !key.to_s.match(/^old_/) && value != nil
    end
  end
end