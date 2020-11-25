module FileManagement
  DEFAULT_LOCATION_FILE_NAME = 'default_location'.freeze

  module_function

  def read_default_location
    File.read(default_location_file_path)
  end

  def write_default_location(location)
    File.write(default_location_file_path, location)
  end

  def default_location_file_path
    File.join(File.dirname(__FILE__), DEFAULT_LOCATION_FILE_NAME)
  end
end
