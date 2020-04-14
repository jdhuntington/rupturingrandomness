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
      exploded_result = exploded_die.possibilities
      #      exploded_result.each { |r|
    end
  end
end
