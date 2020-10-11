BEGIN {
  puts 'Execute first'
}

END {
  puts 'Execute last'
}

def yield_with_double(value)
  puts "#{value} in method"
  3.times do                  # test multiple yields
    yield value, value * 2
  end
end

yield_with_double(5) { |value, double| puts "#{value} and #{double} returned" }

# direct block call

def direct(&block)
  block.call
end

direct { puts 'Running block' }
