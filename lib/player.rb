class Player
  attr_accessor :token

  def initialize(token)
    @token = token
  end
end


class Human < Player
  def take_turn(game)
    HumanGameplay.new(game).take_turn
  end
end


class Jane < Player
  def take_turn(game)
    JaneGameplay.new(game).take_turn
  end
end


class Joshua < Player
  def take_turn(game)
    JoshuaGameplay.new(game).take_turn
  end
end

