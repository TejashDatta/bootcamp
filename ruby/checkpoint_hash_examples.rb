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


# fetch
p hash2[:John]
p hash2.fetch(:John)
p hash2.fetch(:nonexistent, "No key")
p hash2.fetch(:nonexistent)


