class Player
  @@player_count = 0
  attr_accessor :current_answer

  def initialize
    @id = @@player_count += 1
    @life = 3
    @current_answer = 0
  end

  def alive?
    @life > 0 ? true : false
  end

  def remove_life
    @life -= 1
    alive?
  end

end