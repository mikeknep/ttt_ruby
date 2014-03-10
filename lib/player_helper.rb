module PlayerHelper
  def self.build_player(token, intelligence)
    decision_maker = case intelligence
    when 'easy'
      SimpleAI
    when 'hard'
      UnbeatableAI
    when 'human'
      ConsoleUI
    end

    Player.new(token, decision_maker)
  end
end
