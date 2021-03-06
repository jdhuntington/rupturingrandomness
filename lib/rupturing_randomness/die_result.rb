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
    DieResult.new value, new_denominator, numerator * new_denominator / @denominator
  end

  def + other
    DieResult.new(@value + other.value, @denominator * other.denominator, @numerator * other.numerator)
  end

  def merge other
    raise StandardError.new("Values must equal") unless value == other.value

    new_denominator = denominator.lcm other.denominator
    self_scaled = scale new_denominator
    other_scaled = other.scale new_denominator

    DieResult.new value, new_denominator, self_scaled.numerator + other_scaled.numerator
  end

  def == other
    value == other.value &&
      denominator == other.denominator &&
      numerator == other.numerator
  end

  def to_s
    scaling_factor = numerator.gcd(denominator)
    "[#{value}, #{numerator / scaling_factor}/#{denominator / scaling_factor}]"
  end

  def pretty_print
    scaling_factor = numerator.gcd(denominator)
    count = (80 * numerator.to_f / denominator.to_f).to_i
    sprintf "%4d (%4d/%5d) [%-80s]",
            value,
            numerator / scaling_factor,
            denominator / scaling_factor,
            "*" * count
    
  end
end
