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
    winner = @players.detect { |player| player.alive?}
    puts "Congratulations Player #{player.id} you are the winner with #{player.life}/3"
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
      puts player.remove_life ? "still alive #{player.id} with #{player.life}/3" : "Oh noes, you ded #{player.id}"
    end
  end

  def random_congrats
    [
      "Nice one Player #{player.id}!",
      "Keep it up Player #{player.id}!",
      "What...You are a star Player #{player.id}!",
      "Way to go Player #{player.id}!"
    ].sample
  end

  def random_sympathy
    [
      "Still alive Player #{player.id} with #{player.life}/3",
      "Watch out Player #{player.id} with #{player.life}/3",
      "Hang in there Player #{player.id} with #{player.life}/3",
      "If this was a horror movie Player #{player.id}, you would be going up stairs with #{player.life}/3",
      "Maybe next time Player #{player.id} with #{player.life}/3"
    ].sample
  end
end