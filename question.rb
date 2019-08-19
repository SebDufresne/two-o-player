class Question
  attr_accessor :answer
  OPERANDS = ['+','-','*']
  OPERANDS_VERBOSE = ['plus', 'minus', 'multiplied by']

  def initialize()
    @number1 = rand(1..50)
    @number2 = rand(1..50)
    @operator = OPERANDS.sample
    @answer = eval"#{@number1}#{@operator}#{@number2}"
  end

  def ask_question(name)
    index = OPERANDS.find_index(@operator)
    puts "#{name}, what does #{@number1} #{OPERANDS_VERBOSE[index]} #{@number2} equal?"
  end

  def right_answer?(answer)
    @answer.to_s == answer
  end
end