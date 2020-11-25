class Calculator
  def initialize(operation, operand1, operand2)
    @operation = operation
    @operand1 = operand1.to_f
    @operand2 = operand2.to_f
  end

  def calculate
    case @operation
    when 'add'
      @operand1 + @operand2
    when 'subtract'
      @operand1 - @operand2
    when 'multiply'
      @operand1 - @operand2
    when 'divide'
      @operand1 / @operand2
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  unless ARGV.size == 3
    print <<~HELP
      Use: <operator> <operand1> <operand2>
      eg: add 3 4
    HELP
    exit
  end

  calculator = Calculator.new(*ARGV)
  puts calculator.calculate
end
