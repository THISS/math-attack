class Game
  # Start game by asking for player count
  def initialize
    @players = []
    @input = Input.new
    @question = Question.new
  end

  def run_game
    # get player_count
    @input.question = "How many players for this game? "
    player_count = @input.get_current_input.to_i
    # generate players
    player_count.times do
      @players << Player.new
    end
    # Main Loop
    while get_player_count > 1 do
      # generate_question
      @question.generate_question
      # get each users current_answer
      @input.question = @question.current_question
      @players.each do |player|
        puts "player #{player.id}"
        player.current_answer = @input.get_current_input.to_i
      end
        # Check the players answer
      puts "Checking the answers..."
      @players.each do |player|
        check_answer(player)
      end
    end
    puts "Game Over"
  end

  def get_player_count
    @players.select { |player| player.alive? }.size
  end

  def check_answer(player)
    answer = @question.current_answer
      # if answer is incorrect remove life from current player
    if answer.to_i == player.current_answer.to_i
      puts "Nice one #{player.id}"
    else
      puts player.remove_life ? "still alive #{player.id}" : "Oh noes, you ded #{player.id}"
    end
  end
end