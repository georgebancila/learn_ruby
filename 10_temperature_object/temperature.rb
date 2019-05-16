class Temperature
  def initialize(temp)
    if temp.key?(:f)
      @ftemp = temp[:f]
      @ctemp = ftoc(@ftemp)
    elsif temp.key?(:c)
      @ctemp = temp[:c]
      @ftemp = ctof(@ctemp)
    end
  end

  def in_fahrenheit
    @ftemp
  end

  def in_celsius
    @ctemp
  end

  def self.from_celsius(c)
    Temperature.new(:c => c)
  end

  def self.from_fahrenheit(f)
    Temperature.new(:f => f)
  end

  private def ftoc(tempF)
    (tempF - 32) * 5 / 9
  end

  private def ctof(tempC)
    tempC * 1.8 + 32
  end
end

class Celsius < Temperature
  def initialize(c)
    super(:c => c)
  end
end

class Fahrenheit < Temperature
  def initialize(f)
    super(:f => f)
  end
end