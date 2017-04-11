class Input
  attr_reader :current_input
  attr_writer :question
  def initialize
    @current_input = ""
    @question = ""
  end

  def get_current_input
    print @question
    @current_input = gets.chomp
  end
end