(1..10).each do |num|
  print(num, " ")
end
print "\n"

5.times do |num|
  print(num, " ")
end
print "\n"

1.upto(5) { |num| print(num, " ") }
print "\n"

5.downto(0) { |num| print(num, " ") }
print "\n"

1.2.step(0, -0.2) { |num| print(num.round(1), " ") }
print "\n"
