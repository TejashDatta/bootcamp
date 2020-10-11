puts 5 <=> 7
puts 5.eql? 5.0   # object type same or not

# object comparisons
a = [1, 2]
b = [1, 2]
puts a == b
puts a.eql? b
puts a.equal? b   # object same or not comparison

puts defined? a

putc ?q
