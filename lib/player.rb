class Player
  attr_accessor :token

  def initialize(token)
    @token = token
  end
end


class Human < Player
end


class Jane < Player
end


class Joshua < Player
end

