def reverser
  yield.split.map { |word| word.reverse  }.join(' ')
end

def adder(n = 1)
  yield + n
end

def repeater(times = 2)
  times.times { yield }
end