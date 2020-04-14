class Die
  def initialize sides, explosions
    @sides = sides
    @explosions = explosions
  end

  def possibilities
    (1..@sides).to_a
  end
end
