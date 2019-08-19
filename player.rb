class Player
  attr_accessor :lives
  attr_reader :name
  def initialize(n,l)
    @name = n
    @lives = l
  end

  def decrease_lives
    @lives -= 1
  end
end