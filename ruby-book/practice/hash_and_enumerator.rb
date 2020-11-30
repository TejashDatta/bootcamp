p [*8..20].map.with_index(1) { |n, i| "#{n} is at #{i}" }

h = {a: 1, b: 3, c: 5}
h.to_a.each { |letter, number| p letter, number }
h.to_a.each_with_index { |(letter, number), index| p letter, number, index }

a = h.to_a
h = a.to_h
p h = Hash[a]

# enumerator class
p h.each