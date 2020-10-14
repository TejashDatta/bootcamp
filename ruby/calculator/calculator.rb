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
