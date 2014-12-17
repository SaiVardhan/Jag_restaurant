# Dir.glob(File.join(".", "**", "*.rb")).each do |file|
#    require file
# end
# require "test/unit"
 
# class TestInputReader < Test::Unit::TestCase
 
#   def test_csv_file
#     assert_equal(true, InputReader.new(ARGV).check_file_extn?(args[0]) )
#   #  assert_equal(true, SimpleNumber.new('') )
#   end
 
# end

require 'rspec'
require 'csv'

describe "InputReaderTest" do
	 # before :each do
  #       @ir = InputReader.new(ARGV)
  #   end
	context "when other than csv is given" do
        before(:each) do 
        	@file = File.expand_path(File.dirname(File.dirname(__FILE__)) +  '/lib/input_reader.rb')
        end	

        it "should check whether it is file or not" do
            expect(File.ftype(@file)).to eq("file")
		end

		it "should check whether file exists or not" do
			expect(File.exist?(@file)).to be(true)
		end


		it "should check the extension for others" do
			expect(File.extname(@file)).not_to eql('.csv')
		end

	end


	context "when csv file is given" do

		before(:each) do 
			@file = File.expand_path(File.dirname(File.dirname(__FILE__)) + '/data1.csv')
			@file1 = File.expand_path(File.dirname(File.dirname(__FILE__)) + '/Book1.csv')
		end
		it "should check whether file exists or not" do
			expect(File.exist?(@file)).to be(true)
		end

		it "should check whether it is file or not" do
            expect(File.ftype(@file)).to eq("file")
		end

		it "should check whether file is empty or not" do
			expect(File.zero?(@file1)).not_to eql(true)
			#puts @file1.size
		end

		it "should check the extension for csv" do
			#@file = File.expand_path(File.dirname(File.dirname(__FILE__)) + '/data1.csv')
			expect(File.extname(@file)).to eql('.csv')
		 	
		end

		it "csv should have only 3 columns" do
			 expect(CSV.read(@file)[0].to_a.count).to be(3)
		end

		it "restaurant id should be integer" do
			cls_var = CSV.read(@file)[0].to_a[0].to_i.class
			expect(cls_var.to_s).to eq("Fixnum")
		end


	end


end