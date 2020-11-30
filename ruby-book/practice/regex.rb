text = 'alloy 678 metal 500 metum'
pattern = '(?<number>\d+)\s(?<word>me\w+)'
pattern = /#{pattern}/
pattern_2 = %r|(?:\d+)\s(?:me\w+)|
pattern_3 = Regexp.new(/(\d+)\s(me\w+)/)

p text[pattern]
p text[pattern, 2]
p text[pattern, 'number']
p text[pattern, :word]

p text =~ pattern
p text !~ pattern

matched = pattern.match(text)
matched = text.match(pattern)
p matched[0..-1]
p matched['word'], matched[:number]
p text.match? pattern

p 'heEL\nooo'.match(/heel.oo/im)

/(?<number>\d+)\s(?<word>me\w+)/ =~ text
p number, word

p text.scan(pattern_2)

p text.split(/\s*\d+\s*/)

p text.gsub(pattern_3, '\1___\2')
p text.gsub(pattern, '\k<number>___\k<word>')
p text.gsub(/[a5y]/, {'a' => 'A', 'y' => 'Y', '5' => 'FIVE'})
p text.gsub(/[ma]/) { |matched| matched.upcase }

p "heEL\nooo".match(/heel.oo/im)

p "a string" =~ /s\w+ # string /x

p text.gsub!(/[ma]/) { |matched| matched.upcase }