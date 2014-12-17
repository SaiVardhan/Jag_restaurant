require 'csv'
class InputReader

  def initialize(args)
  	@file = check_file_extn?(args[0]) ? args[0] : (raise "Input file not specified")
    read_csv_data(@file)
  end

  def check_file_extn?(file)
  File.exist?(file) && file.include?('.csv') 
  end	

  def read_csv_data(file)
  	csv_text = File.read(file)
    csv = CSV.parse(csv_text, :headers => true)
    
    csv.each do |row|
      puts row.inspect
    end
  end

end

