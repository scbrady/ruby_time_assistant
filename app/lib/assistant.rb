class Assistant
  def self.new_client(params)
    Client.create!(params)
    "Donezo, created #{params[:name]}"
  end

  def self.update_client(params)
    self.set_client(params[:current_name])
    @client.update(filter_params(params))
    "Donezo, updated #{@client.name}"
  end

  def self.new_project(params)
    self.set_client(params[:current_client])
    @client.projects.create!(filter_params(params))
    "Donezo, created #{params[:name]}"
  end

  def self.update_project(params)
    self.set_project(params[:current_name])
    @project.update(filter_params(params))
    "Donezo, updated #{@project.name}"
  end

  def self.start_work(params)
    # TODO: Get latest work from current user
    latest_work = Work.new

    if latest_work.end === nil
      yield "You are currently working on something else, should I end that and start this new one?"
    else
      self.set_project(params[:current_project])
      @project.works.create!(:start => DateTime.now)
      "Donezo"
    end
  end

  def self.end_work(params)
    self.set_project(params[:current_project])
    @project.works.create!({:end => DateTime.now, :description => params[:description]})
    "Donezo, you worked for ???"
  end

  #
  # Private methods
  #
  private

  def self.set_client(name)
    @client = Client.find_by(name: name)
    raise "Sorry, I couldn't find #{name} in your client list." if @client == nil
  end

  def self.set_project(name)
    @project = Project.find_by(name: name)
    raise "Sorry, I couldn't find #{name} in your project list." if @project == nil
  end

  def self.filter_params(params)
    params.select do |key, value|
      !key.to_s.match(/^current_/) && value != nil
    end
  end
end