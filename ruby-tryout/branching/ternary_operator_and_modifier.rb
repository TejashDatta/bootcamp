number = gets.chomp.to_i
puts '0を入力してください。' unless number == 0

puts '数値が大きいです' if number > 500

value = number > 500 ? '大きい' : '小さい'
puts value
