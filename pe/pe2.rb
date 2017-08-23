#!/usr/local/bin/ruby
def fib x
	return  x > 1 ? fib(x - 1) + fib(x - 2) : 1
	# return  if x > 1 then fib(x - 1) + fib(x - 2) else 1 end
end 

# (0..5).each {|i| puts fib i}

def pe2 limit
	store = [1,1]
	total = 0
	while store.last < limit
		store.push(store[-1] + store[-2])
        total += store.last if store.last.even?
    end
    return total
end

puts(pe2 4000000)
    
        



