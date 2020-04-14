require "minitest/autorun"
require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'lib', 'rupturing_randomness'))

describe Die do
  before do
    @die = Die.new
  end

  describe "existence" do
    it "must exist" do
      assert !@die.nil?
    end
  end
end
