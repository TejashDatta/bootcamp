module FileManagement
  API_KEY_FILE_NAME = 'api_key'.freeze
  LOCATION_FILE_NAME = 'default_location'.freeze

  module_function

  def path(file_name)
    File.join(File.dirname(__FILE__), file_name)
  end

  def read(file_name)
    path = path(file_name)
    return unless File.exist? path

    File.read(path).chomp
  end

  def read_api_key
    read(API_KEY_FILE_NAME)
  end

  def read_default_location
    read(LOCATION_FILE_NAME)
  end

  def write_default_location(location)
    File.write(path(LOCATION_FILE_NAME), location)
  end
end
