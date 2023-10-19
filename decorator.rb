require_relative
class Decorator < Nameable
  attr_reader :nameable

  def initialize(nameable)
    @nameable = nameable
  end

  def correct_name
    nameable.correct_name
  end
end
