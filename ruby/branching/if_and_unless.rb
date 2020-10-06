puts "文字列を入力してください："
user_string = gets.chomp

example_string1 = "example"
example_string2 = "test"

if user_string < example_string1
  puts "#{user_string}は#{example_string1}より小さいです。"
elsif user_string < example_string2
  puts "#{user_string}は{example_string1}より大きいですが#{example_string2}より小さいです。"
else
  puts "#{user_string}は#{example_string1}と#{example_string2}より大きいです。"
end

unless user_string == 'hide unless'
  puts "unless文の中"
end