# Math Attack

## Different Classes
 - Player
 - Question
 - Game
 - ARGV class

## Player
 - id
 - life (start at 3)
 - is_alive?
 - remove_life (removes one from life and checks if is_alive?)
 - current_answer

 ## Question
 - count (start at 1)
 - current_answer (initialized at 0)
 - current_question
 - question_generator - will set current_answer and current_question
 - random_number_generator
 - random_operator_generator
 returns a hash with :question and :answer

 ## Game
 - player array of a hash player
 - player_count returns count of players still alive
 - game loop while more than one player is_alive?
  - generates a question
  - gets user input from all players
  - checks current answer against player :current_answer
    - if answer is incorrect remove_life from player

## Gets.chomp 
- this class will prompt the user for data and cast to int and return to game to set current users :current_answer
  