class Die
  def initialize sides, explosions
    @sides = sides
    @explosions = explosions
  end

  def possibilities
    (1..@sides).map {|x| DieResult.new x, @sides}
  end
end
