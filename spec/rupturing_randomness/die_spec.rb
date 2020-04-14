require "minitest/autorun"
require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'lib', 'rupturing_randomness'))

describe Die do

  describe "possibilities with no explosions" do
    before do
      @die = Die.new(6, 0)
    end

    it 'has a chance to hit all 6 numbers evenly' do
      assert_equal (1..6).map { |x| DieResult.new(x, 6) }, @die.possibilities
    end
  end

  describe "possibilities with 1 explosion" do
    before do
      @die = Die.new(6, 1)
    end

    it 'has a chance to hit 1-5 evenly, and 7-12 with lower probablility' do
      expected = (1..5).map { |x| DieResult.new(x, 6) } + (7..12).map { |x| DieResult.new(x, 36) }
      assert_equal expected, @die.possibilities
    end
  end

  describe 'd3 with 2 explosions' do
    before do
      @die = Die.new(3, 2)
    end

    it 'has a chance to hit 1-5 evenly, and 7-12 with lower probablility' do
      expected = (1..2).map { |x| DieResult.new(x, 3) } +
                 (4..5).map { |x| DieResult.new(x, 9) } +
                 (7..9).map { |x| DieResult.new(x, 27) }
      assert_equal expected, @die.possibilities
    end
  end
end
