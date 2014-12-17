require 'rspec'
require_relative '../lib/input_reader'

describe "InputReader" do
  describe "#valid?" do
    it "returns true when file is a csv" do
      input_reader = InputReader.new('/home/vamsi/Projects/Jag_restaurant/data1.csv')
      expect(input_reader).to be_valid
    end

    it "returns false when file is not a csv" do
      input_reader = InputReader.new('/home/vamsi/Projects/Jag_restaurant/README.md')
      expect(input_reader).to_not be_valid
    end
  end
end
