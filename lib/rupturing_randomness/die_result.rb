class DieResult
  attr_reader :result, :denominator

  def initialize result, denominator
    @result = result
    @denominator = denominator
  end

  def == other
    result == other.result && denominator == other.denominator
  end
end
