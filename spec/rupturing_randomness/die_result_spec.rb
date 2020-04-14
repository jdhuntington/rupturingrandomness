require "minitest/autorun"
require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'lib', 'rupturing_randomness'))

describe DieResult do
  describe "#adjust" do
    before do
      result = DieResult.new(4, 6)
      @scaled_result = result.adjust 6
    end

    it 'sets the denominator to a multiple of the adjustment' do
      assert_equal 36, @scaled_result.denominator
    end

    it 'sets the value to value + adjustment' do
      assert_equal 10, @scaled_result.value
    end
  end

  describe '#scale' do
    before do
      @r = DieResult.new(0, 5, 2)
      @r.scale 15
    end

    it 'modifies the denomniator' do
      assert_equal 15, @r.denominator
    end

    it 'modifies the numerator' do
      assert_equal 6, @r.numerator
    end
  end
end
