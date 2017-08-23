#!/usr/local/bin/ruby
def eratosthenes_seive limit
  primes = [ true ] * limit
	(2..Math.sqrt(limit)).each do |n|
    if primes[n]
      primes.map!.with_index { |x, i| (i % n == 0 and i != n )? x && false : x && true }
    end
  end
  return primes.map.with_index { |x, i| x ? i : x }.select { |x| x and x != 1 }
end



print eratosthenes_seive(10000) 

def pe3(number)
  primes = eratosthenes_seive(Math.sqrt(number))
  prime_factor = []
  for i in primes
    n = number
    while n % i == 0
      n = n / i
      prime_factor.push(i)
    end
  end
  return prime_factor.empty? ? [ number ] : prime_factor
end

print pe3(600851475143)

