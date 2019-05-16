def measure(n = 1)
  timeBefore = Time.now
  n.times { yield }
  timeAfter = Time.now
  (timeAfter - timeBefore) / n
end
