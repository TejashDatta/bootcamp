# 文字列の初期化
string1 = "First string"
string2 = String.new("Second string")

# エスケープ文字の実行、%q, %Q の使い
puts("Puts:", string1, string2)
print("Print:", string1, string2, "\n")
puts "Escape \t character \\n testing"
puts 'Escape \t characters don\'t work in \n single quote strings'
puts %Q(Freely use " " within string)
puts %q|\| Needs to be escaped|

# ヒアドキュメント
heredocument_example = <<~SENTENCES
  first line
    test indent
  second line
SENTENCES

puts heredocument_example

# 文字列に変数を埋め込む
number1 = 70
number2 = 20
puts "#{number1} + #{number2} = #{number1 + number2}"

# 文字列の連結
introduction = "My name is "
name = "Tejash"

#文字列の連結: 文字列に追加
name << " Datta"

#文字列の連結: 新しい文字列
introduce_self = introduction + name

puts introduce_self

puts "文字列の繰り返し " * 4

# insert into string
string = 'Hello'
string[1] = 'EPP'

string.insert(2, '244')
string[2, 0] = '244'
string[1, 3] = 'pen'
string[2..4] = 'stool'
p string

# index
p string.index('non')
p string.rindex('PP')
p string.include? 'PP'

string.delete! 'PP'
puts string

# strip
string_whitespace = '   hell    ppp     '
puts string_whitespace.lstrip
puts string_whitespace.rstrip
string_whitespace.strip!

# split
string = 'Tejash, Jack, James, '
p string.split(', ')
p string.split(', ', -1)
p string.split(', ', 2)
