class DieResult
  attr_reader :value, :denominator

  def initialize value, denominator
    @value = value
    @denominator = denominator
  end

  # Used to adjust the likelihood AND value of this result
  # when it comes at the end of an explosion
  def adjust scalar
    @value += scalar
    @denominator *= scalar
  end

  def == other
    value == other.value && denominator == other.denominator
  end
end
