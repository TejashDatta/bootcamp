# new

p Array.new
p []
p Array.new(5)
p Array.new(5, 'Eg')

example_array = Array.new(15) { |index| index + 5 }

copy_array = Array.new(example_array)

p example_array
p copy_array

# access
p example_array[1]
p example_array.at(1)

# size
p example_array.size

# looping
example_array.each { |element| print "#{element}, " }
puts

# subarray
p example_array[1..3]
p example_array.slice(1..3)
p example_array[1...3]
p example_array[2, 2]
p example_array.slice(2, 2)

# subarray: modify
example_array[0, 2] = [12, 35, 78]
p example_array
example_array[3..5] = 100
p example_array

# insert at position
example_array[1, 0] = 99
p example_array

# push
example_array.push(214, 30)

# flatten
p [1, 3, [29, 59, 40], 4].flatten
example_array[0] = [12, 100, 78]
example_array.flatten!

# uniq
new_uniq_array = example_array.uniq
example_array.uniq!

# compact
example_array[1] = example_array[3] = nil
p example_array.compact
example_array.compact!

# deleting elements: by value
example_array.delete(12)
example_array -= [12, 78]
example_array -= [12]

# deleting elements: by position
example_array.shift
example_array.delete_at(4)
example_array.slice!(4)
example_array.slice!(1..3)
p example_array

# delete by condition
p(example_array.reject { |element| element > 20 })
example_array.reject! { |element| element > 20 }
example_array.delete_if { |element| element > 20 }

# pop
p example_array.pop

# order: reverse
new_reverse_array = example_array.reverse
example_array.reverse!
# order: sort
p example_array.sort
example_array.sort!

# transpose
matrix = [[1, 2, 3],
          [4, 5, 6]]

p matrix, matrix.transpose
