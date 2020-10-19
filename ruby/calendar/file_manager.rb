module FileManager
  module_function

  def data_directory_path
    File.join(Dir.home, '.calendar-data')
  end

  def ensure_data_directory_exists
    unless File.exist?(data_directory_path) && File.ftype(data_directory_path) == 'directory'
      Dir.mkdir(data_directory_path)
    end
  end

  def create_path(name)
    ensure_data_directory_exists
    File.join(data_directory_path, name)
  end

  def read(name)
    ensure_data_directory_exists
    File.read(create_path(name))
  end

  def write(name, content)
    ensure_data_directory_exists
    File.write(create_path(name), content)
  end

  def delete(name)
    ensure_data_directory_exists
    File.delete(create_path(name))
  end

  def list_all
    ensure_data_directory_exists
    Dir.children(data_directory_path)
  end

  def reset
    ensure_data_directory_exists
    Dir.each_child(data_directory_path) do |name|
      File.delete(create_path(name))
    end
  end
end
