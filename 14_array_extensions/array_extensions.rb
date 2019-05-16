class Array
  def sum
    sum = 0
    each do |x|
      sum += x
    end
    sum
  end

  def square
    values = map! do |x|
      x *= x
    end
    values
  end

  def square!
    map! do |x|
      x *= x
    end
    self
  end
end
