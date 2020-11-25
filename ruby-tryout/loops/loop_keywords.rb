i = 0
loop {
  i += 1
  break if i > 10
  
  puts i
  
  next if i.even?
  
  puts "i again: #{i}"
}
