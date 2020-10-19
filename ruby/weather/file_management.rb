module FileManagement
  LOCATION_FILE_NAME = 'default_location'.freeze

  module_function

  def path(file_name)
    File.join(File.dirname(__FILE__), file_name)
  end

  def read_default_location
    path = path(LOCATION_FILE_NAME)
    return unless File.exist? path

    File.read(path).chomp
  end

  def write_default_location(location)
    File.write(path(LOCATION_FILE_NAME), location)
  end
end
