module FileManager
  module_function

  def data_directory_path
    File.join(Dir.home, '.calendar-data')
  end

  def check_for_directory
    unless File.exist?(data_directory_path) && File.ftype(data_directory_path) == 'directory'
      Dir.mkdir(data_directory_path)
    end
  end

  def create_path(name)
    check_for_directory
    File.join(data_directory_path, name)
  end

  def read(name)
    check_for_directory
    File.read(create_path(name))
  end

  def write(name, content)
    check_for_directory
    File.write(create_path(name), content)
  end

  def delete(name)
    check_for_directory
    File.delete(create_path(name))
  end

  def list_all
    check_for_directory
    Dir.children(data_directory_path)
  end

  def reset
    check_for_directory
    Dir.each_child(data_directory_path) do |name|
      File.delete(create_path(name))
    end
  end
end
