def subtract(a, b)
  a - b
end

def add(a, b)
  a + b
end

def sum(arr)
  s = 0
  arr.each { |x| s += x }
  s
end

def multiply(a, b, *others)
  p = a * b
  p if others.nil?
  others.each { |x| p *= x }
  p
end

def power(a, b)
  a**b
end

def factorial(a)
  return 1 if a.zero?

  res = 1
  while a != 1
    res *= a
    a -= 1
  end
  res
end