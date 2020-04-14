class Die
  def initialize sides, explosions
    @sides = sides
    @explosions = explosions
  end

  def possibilities
    if @explosions.zero?
      (1..@sides).map {|x| DieResult.new x, @sides}
    else
      exploded_die = Die.new @sides, @explosions - 1
      exploded_result = exploded_die.possibilities.map { |p| p.adjust @sides }
      (1...@sides).map {|x| DieResult.new x, @sides} + exploded_result
    end
  end
end
