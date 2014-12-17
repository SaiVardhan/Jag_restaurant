class InputReader
  attr_reader :file_path

  def initialize(file_path)
    @file_path = file_path
  end

  def valid?
    file_path.split('.').last == 'csv'
  end
end