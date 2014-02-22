module PlayerHelper
  def self.build_player(name, token)
    class_name = name.capitalize + "Player"
    Object.const_get(class_name).new(token)
  end
end
