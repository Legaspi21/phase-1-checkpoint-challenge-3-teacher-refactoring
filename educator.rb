require_relative 'high_fivable'
require_relative 'person'

class Educator < Person
  include HighFivable
  attr_reader :age, :phase, :salary, :TARGET_RAISE
  attr_accessor :name
  def initialize(options={})
    super
    @phase = 3
  end

  def set_phase(num)
    @phase = num
    "Cool, I've always wanted to teach phase #{num}!"
  end

  def salary=(new_salary)
    puts "This better be good!"
    @salary = new_salary
  end

  def receive_raise(raise)
    @salary += raise
  end

  def set_performance_rating(rating)
    response = ""
    if rating > self.class::RATING_THRESHOLD_FOR_RAISE
      response = "Yay, I'm a great employee!"
      receive_raise(self.target_raise)
    else
      response += "Oh, well -- thanks to this actionable, specific, and kind "
      response += "feedback, I'll do better next time."
    end
    response
  end
end
