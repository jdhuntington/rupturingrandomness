require "minitest/autorun"
require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'lib', 'rupturing_randomness'))

describe DicePool do
  describe "combining results" do
    it 'combines results of multiple dice' do
      pool = DicePool.new(Die.new(2,0), Die.new(2,0))
      expected = [DieResult.new(2, 4), DieResult.new(3, 4), DieResult.new(3, 4), DieResult.new(4, 4)]
      actual = pool.possibilities
      assert_equal expected, actual
    end
  end
end
