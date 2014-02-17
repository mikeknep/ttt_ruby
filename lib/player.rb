class Player
  attr_accessor :token

  def initialize(params={})
    @token = params[:token]
  end
end
