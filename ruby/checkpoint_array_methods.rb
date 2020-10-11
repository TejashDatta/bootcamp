# new

p Array.new
p []
p Array.new(5)
p Array.new(5, 'Eg')
p Array(3..6)

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

# insert to front
example_array.unshift(-123)

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

array1 = Array.new(10) { |index| index * 2 }

p array1.first, array1.last, array1.take(3), array1.drop(7)

p array1.include? 5

puts array1.join(' - ')
puts array1 * ' - '

p array1.concat([2, 4], [90, 10])

p array1.index(90)

p array1.empty?

p [1, 2, 3].zip([4, 5, 6], [7, 8, 9])

p array1.rotate(-2)

# BLOCK METHODS

# select! same as keep_if
p array1.select { |element| element.even? }

# map same as collect
p (array1.map { |element| element**2 })

reversed_numbers = ''

array1.reverse_each do |element|
  reversed_numbers << element.to_s << '-'
end

puts reversed_numbers

array1.each_index { |index| print index, ' ' }
puts
array1.each_with_index { |value, index| print index, '-', value, ' ' }
puts

# reduce
p array1.reduce(:+)
p(array1.reduce { |result, current| result += current })
p array1.reduce(10) { |result, current| result += current }

hash_array = [{ name: 'Tejash', age: 40 }, { name: 'Charles', age: 30 }]
p(hash_array.sort_by { |element| element[:age] })
