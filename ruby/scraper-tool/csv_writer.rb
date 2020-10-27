class CSVWriter
  def initialize(file_name)
    @file = File.open(File.join(File.dirname(__FILE__), file_name + '.csv'), 'w')
  end

  def write_line(line)
    @file.puts line
  end

  def close_file
    @file.close
  end
end
