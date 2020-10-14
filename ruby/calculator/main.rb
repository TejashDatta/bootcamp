unless ARGV.size == 3
  print <<~HELP
    Use: <operator> <operand1> <operand2>
    eg: add 3 4
  HELP
  exit
end

require_relative 'calculator'

calculator = Calculator.new(*ARGV)
puts calculator.calculate
