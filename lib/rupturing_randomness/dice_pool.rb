class DicePool
  def initialize *dice
    @dice = dice
  end

  def possibilities
    @dice.map(&:possibilities).reduce do |acc, die_possibilities|
      values = die_possibilities.map { |possibility| acc.map { |acc_val| acc_val + possibility }}.flatten
      values.group_by(&:value).map do |_, vals|
        vals.reduce { |summed, val| summed.merge(val) }
      end.flatten
    end
  end
end
