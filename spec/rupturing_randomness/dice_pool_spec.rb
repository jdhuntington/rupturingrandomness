require "minitest/autorun"
require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'lib', 'rupturing_randomness'))

describe DicePool do
  describe "combining results" do
    it '2d2, no explosions' do
      pool = DicePool.new(Die.new(2,0), Die.new(2,0))
      expected = [DieResult.new(2, 4), DieResult.new(3, 4, 2), DieResult.new(4, 4)]
      actual = pool.possibilities
      assert_equal expected, actual
    end

    it '2d3, no explosions' do
      pool = DicePool.new(Die.new(3,0), Die.new(3,0))
      expected = [DieResult.new(2, 9), DieResult.new(3, 9, 2), DieResult.new(4, 9, 3), DieResult.new(5, 9, 2), DieResult.new(6, 9)]
      actual = pool.possibilities
      assert_equal expected, actual
    end
  end
end
