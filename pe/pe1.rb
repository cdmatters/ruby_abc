#!/usr/local/bin/ruby
def pe1(limit)
  i = 0 
  total = 0
  while i < limit
    if i % 3 == 0 or i % 5 == 0
      total += i
    end
    i += 1
  end
  return total
end


def pe1_statement_modifier(limit)
  i = 0
  total = 0  
  while i < limit
    total += i if i % 3 == 0 or i % 5 == 0 
    i += 1
  end 
  return total
end

def pe1_ranges(limit)
  total = 0
  (0...limit).each { |i| total += i if i % 3 == 0 or i % 5 == 0 }
  # (0..limit) is range-inclusive (0...limit) is range-not-inclusive
  return total 
end


puts pe1(1000) 
puts pe1_statement_modifier (1000)
puts pe1_ranges(1000)
       