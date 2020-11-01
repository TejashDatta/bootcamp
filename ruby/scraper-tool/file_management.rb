module FileManagement
  BASE_PATH = File.dirname(__FILE__)
  THUMBNAIL_DIRECTORY_PATH = File.join(BASE_PATH, 'thumbnails')

  module_function

  def open_write(file_name)
    File.open(File.join(BASE_PATH, file_name), 'w') { |file| yield file }
  end

  def save_thumbnail(name, content, extension = '.jpeg')
    unless File.exist?(THUMBNAIL_DIRECTORY_PATH) && File.ftype(THUMBNAIL_DIRECTORY_PATH) == 'directory'
      Dir.mkdir(THUMBNAIL_DIRECTORY_PATH)
    end

    File.write(File.join(THUMBNAIL_DIRECTORY_PATH, name.gsub('/', ' ') + extension), content)
  end
end
