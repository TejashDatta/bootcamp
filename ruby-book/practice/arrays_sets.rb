a = (1..15).to_a

p a.values_at(2, 4, 8)
p a.first(3)
p a.last(3)
p a[1, 4]
p a[-1, 4]
a.push(3, 5, 8)

# set operations

a = [*1..15]
b = [*13..20]

p a + b
p a | b
p a - b
p a & b 

# sets
require 'set'

a = Set.new(a)
b = Set.new(b)

p a + b
p a | b
p a - b
p a & b 
