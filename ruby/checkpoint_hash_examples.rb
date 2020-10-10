# create hash
hash = {}
hash = { 'John' => 20, 'Mary' => 30 }
hash = { :John => 20, :Mary => 30 }
hash = { John: 20, Mary: 20 }
hash = Hash[:John => 20, :Mary => 30]
hash = Hash[John: 20, Mary: 20]
hash = Hash[:John, 20, :Mary, 30]
temporary_array = [:John, 20, :Mary, 30]
hash = Hash[*temporary_array]
copy_hash = Hash[hash]

# create hash: new method
hash = Hash.new
hash = Hash.new("none")
hash = Hash.new { |hash, key| key }
hash = Hash.new { |hash, key| hash[key] = key }

hash.default = 'default'

# fetch
p hash[:John]
p hash.fetch(:John)
p hash.fetch(:nonexistent, "No key")
p hash.fetch(:nonexistent) { |key| "The key #{key} doesn't exist" }

# store
hash[:James] = 40
hash.store(:Richard, 20)

# length
p hash.length, hash.size

# to array
p hash.keys
p hash.values
p hash.to_a

# looping
hash.each do |key, value|
  print "#{key} = #{value}\n"
end

hash.each_key { |key| print(key, ' ') }

hash.each_value { |value| print(value, ' ') }

# delete
hash.delete(:John)
print("Deleted value: ", hash.delete(:nonexistent) { |key| "#{key} not found" }, "\n")

p hash.reject { |key, value| value < 30 }
p hash.select { |key, value| value < 30 }

hash.clear

hash = { UK: 'Boris', USA: 'Trump', India: 'Modi' }

# values
p hash.empty?
p hash.value?('Modi') #same as has_value?
p hash.index('Modi')
p hash.include?(:USA) #same as member? key? has_key?
p hash.values_at(:India, :UK)

p hash.invert

# display
puts hash.inspect
hash_string_form = hash.to_s
puts hash_string_form

# shift
p hash.shift
p hash

# merge same as update
hash.merge!({ Israel: 'Netanyahu', Pakistan: 'Khan', USA: 'Biden' })
hash.merge!({ USA: 'Joe', India: 'Narendra' }) { |key, old_value, new_value| new_value + ' ' + old_value }
p hash

# flatten
p hash.flatten

# replace
hash1 = {}
hash.replace(hash1)
p hash
