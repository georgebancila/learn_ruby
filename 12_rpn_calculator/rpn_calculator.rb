class RPNCalculator
  def initialize
    @evaluation = []
    @value = 0
  end

  def evaluation
    @evaluation
  end

  attr_reader :value

  def push(number)
    @evaluation << number if number.is_a?(Integer)
  end

  def plus
    calculator_error if @evaluation.empty?

    b = @evaluation.pop.to_f
    a = @evaluation.pop.to_f
    @value = a + b
    @evaluation << @value
    value
  end

  def minus
    calculator_error if @evaluation.empty?

    b = @evaluation.pop.to_f
    a = @evaluation.pop.to_f
    @value = a - b
    @evaluation << @value
    value
  end

  def divide
    calculator_error if @evaluation.empty?

    b = @evaluation.pop.to_f
    a = @evaluation.pop.to_f
    @value = a / b
    @evaluation << @value
    value
  end

  def times
    calculator_error if @evaluation.empty?

    b = @evaluation.pop.to_f
    a = @evaluation.pop.to_f
    @value = a * b
    @evaluation << @value
    value
  end

  def tokens(text)
    values = text.split
    values.map! do |x|
      x = if !x.is_integer?
        x.to_sym
      else
        x.to_i
          end
    end
    values
  end

  def evaluate(text)
    values = tokens(text)
    values.each do |x|
      if x.is_a?(Integer)
        push(x)
      else
        case x
        when :+
          plus
        when :-
          minus
        when :*
          times
        when :/
          divide
        else
          unknown_character
        end
      end
    end
    @value
  end

  private

  def calculator_error
    raise 'calculator is empty'
  end

  private

  def unknown_character
    raise 'i don\'t know this character'
  end
end

class String
  def is_integer?
    to_i.to_s == self
  end
end