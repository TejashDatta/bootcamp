module Config
  module_function

  def data_directory_path
    path = File.join(Dir.home, '.calendar-data')
    Dir.mkdir(path) unless File.exist?(path) && File.ftype(path) == 'directory'
    path
  end
end
