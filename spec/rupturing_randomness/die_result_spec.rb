require "minitest/autorun"
require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'lib', 'rupturing_randomness'))

describe DieResult do
  describe "#adjust" do
    before do
      result = DieResult.new(4, 6)
      @adjusted_result = result.adjust 6
    end

    it 'sets the denominator to a multiple of the adjustment' do
      assert_equal 36, @adjusted_result.denominator
    end

    it 'sets the value to value + adjustment' do
      assert_equal 10, @adjusted_result.value
    end
  end

  describe '#scale' do
    before do
      original = DieResult.new(0, 5, 2)
      @r = original.scale 15
    end

    it 'scales the denomniator' do
      assert_equal 15, @r.denominator
    end

    it 'scales the numerator' do
      assert_equal 6, @r.numerator
    end
  end

  describe '#+' do
    before do
      @result = DieResult.new(1, 2) + DieResult.new(2, 3, 2)
    end

    it 'adds values' do
      assert_equal 3, @result.value
    end

    it 'multiplies denominators' do
      assert_equal 6, @result.denominator
    end

    it 'multiplies numerators' do
      assert_equal 2, @result.numerator
    end
  end

  describe '#merge' do
    it 'throws when merging values of different denominators' do
      assert_raises StandardError do
        DieResult.new(1, 2).merge(DieResult.new(2,2))
      end
    end

    it 'combines numerators' do
      result = DieResult.new(1, 2).merge(DieResult.new(1,2))
      assert_equal 2, result.numerator
    end

    it 'finds lcd denominator' do
      result = DieResult.new(1, 3).merge(DieResult.new(1,7))
      assert_equal 21, result.denominator
      assert_equal 10, result.numerator
    end
  end
end
