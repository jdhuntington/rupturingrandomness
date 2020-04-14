require "minitest/autorun"
require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'lib', 'rupturing_randomness'))

describe DieResult do
  describe "adjusting" do
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
end
