write_file = File.new('test1.txt', 'w')

unless write_file
  puts 'File creation failed'
  exit
end

write_file.chmod(0o777)

p write_file.path

write_file.syswrite("A few sample lines \nline one\nline two\nline three\n")
write_file.puts('The last line')

write_file.close

# reading
File.open('test1.txt', 'r') { |read_file| puts read_file.sysread(23) }

File.open('test1.txt', 'r') do |read_file|
  p read_file.gets
  read_file.each_byte { |char| putc char }
end

file_lines = IO.readlines('test1.txt')
p file_lines

i = 1
IO.foreach('test1.txt') do |line|
  print i, ': ', line
  i += 1
end

p File.exist? 'test1.txt'
p File.file? 'test1.txt'

p File.zero? 'test1.txt'
p File.size? 'test1.txt'

p File.ftype 'test1.txt'

p File.readable? 'test1.txt'
p File.writable? 'test1.txt'
p File.executable? 'test1.txt'

p File.mtime 'test1.txt'
p File.ctime 'test1.txt'
p File.atime 'test1.txt'

File.rename('test1.txt', 'test2.txt')
File.delete('test2.txt')
