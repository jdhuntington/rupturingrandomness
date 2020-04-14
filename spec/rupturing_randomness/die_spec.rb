require "minitest/autorun"
require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'lib', 'rupturing_randomness'))

describe Die do

  describe "possibilities with no explosions" do
    before do
      @die = Die.new(6, 0)
    end

    it 'has a chance to hit all 6 numbers evenly' do
      assert_equal (1..6).to_a, @die.possibilities
    end
  end
end
