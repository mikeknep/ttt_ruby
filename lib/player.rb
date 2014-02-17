class Player
  attr_accessor :token

  def initialize(token)
    @token = token
  end

  def self.build_player(name, token)
    Object.const_get(name).new(token)
  end
end


class Human < Player
end


class Jane < Player
end


class Joshua < Player
end

