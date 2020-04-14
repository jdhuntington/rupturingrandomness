class DieResult
  attr_reader :value, :denominator, :numerator

  def initialize value, denominator, numerator = 1
    @value = value
    @denominator = denominator
    @numerator = numerator
  end

  # Used to adjust the likelihood AND value of this result
  # when it comes at the end of an explosion
  def adjust scalar
    DieResult.new(@value + scalar, @denominator * scalar)
  end

  def scale new_denominator
    @numerator *= (new_denominator / @denominator)
    @denominator = new_denominator
  end

  def == other
    value == other.value &&
      denominator == other.denominator &&
      numerator == other.numerator
  end
end
