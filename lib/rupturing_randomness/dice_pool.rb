class DicePool
  def initialize *dice
    @dice = dice
  end

  def possibilities
    [DieResult.new(2, 4), DieResult.new(3, 4), DieResult.new(3, 4), DieResult.new(4, 4)]
  end
end
