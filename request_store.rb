class RequestStore

  def initialize
  	@list = Array.new
  end

  def add request
  	@list.push request
  end

  def all
  	@list
  end

end