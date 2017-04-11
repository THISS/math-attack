class Question
  @@question_count = 0
  attr_reader :current_answer, :current_question
  def initialize
    @current_answer = 0
    @current_question = ""
  end

  def random_number_generator
    rand(30)
  end

  def random_operator_generator
    ["+", "-", "/", "*"].sample
  end

  def generate_question
    @@question_count += 1
    first_integer = random_number_generator
    second_integer = random_number_generator
    operator = random_operator_generator
    @current_question = first_integer.to_s + operator.to_s + second_integer.to_s
    @current_answer = first_integer.public_send(operator, second_integer)
  end

end