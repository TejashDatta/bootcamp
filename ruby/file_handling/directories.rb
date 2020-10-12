Dir.mkdir 'newdirectory1' unless File.exist? 'newdirectory1'
Dir.mkdir 'newdirectory2', 755 unless File.exist? 'newdirectory2'

Dir.delete 'newdirectory1'
Dir.delete 'newdirectory2'

p Dir.pwd

Dir.chdir '/home/tejash/'
p Dir.pwd

p Dir.entries '/home/tejash/Desktop/bootcamp'

Dir.foreach('/home/tejash/Desktop/bootcamp') do |entry|
  puts entry
end

p Dir['/home/tejash/Desktop/bootcamp/*']

require 'tmpdir'

p Dir.tmpdir

require 'tempfile'

temp_file = Tempfile.new('temp_file')
temp_file.puts "Hello"
puts temp_file.path
temp_file.close
