# default

def sum(a = 30, b = 20)
  a + b
end

puts sum

# parameter array
def create_task(job_name, *team_members)
  output = ""
  team_members.each do |team_member|
    output << team_member << ', '
  end
  print(output, "are working on ", job_name, "\n")
end

create_task('Database', 'Alex', 'Jones', 'Natasha')

# multiple return values

def add_5(number1, number2)
  [number1 + 5, number2 + 5]
end

puts add_5(2, 4)
