module PlayerHelper
  def self.build_player(name, token)
    Object.const_get(name.capitalize).new(token)
  end
end
