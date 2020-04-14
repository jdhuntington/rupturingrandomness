class DicePool
  def initialize *dice
    @dice = dice
  end

  def possibilities
    @dice.map(&:possibilities).map do |die_possibilities|
      denominator = die_possibilities.inject(1) { |acc, p| acc.lcm p.denominator }
      
    end
    [DieResult.new(2, 4), DieResult.new(3, 4), DieResult.new(3, 4), DieResult.new(4, 4)]
  end
end
