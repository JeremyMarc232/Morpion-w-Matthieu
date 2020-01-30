class Player
  attr_accessor :name, :token, :score, :is_current_player, :is_first_player, :emoji
  def initialize (name, token, emoji)
    @name = name
    @token = token
    @score = 0
    @is_current_player = false
    @is_first_player = false
    @emoji = emoji
  end

end