# Containers, Blocks, Iterators


puts """ 
C4.1 & 4.2 concern arrays (lists) and hashes (dicts).
Although these have mch bigger interfaces than with python, they are largely the
same beasts.

Skipping to Iterators and Blocks
"""

puts "---------------------------------"

puts """
To some degree already covered blocks. They are like anonymous pieces of 
code. 

An iterator is simply a method that can invoke a block of code
It does this by calling the 'yield' keyword
"""

def fib_up_to(max)
  i1, i2 = 1, 1
  while i1 <= max
    yield i1
    i1, i2 = i2, i1 + i2
  end
end

i = 0
fib_up_to(100) { |f| i += 1; print "f(", i, ")=", f, ", " }

puts "You can also pass values back in to the iterator (function) using yield"

#eg implement find on an array

class CustomArray
  def find     # assume function 'each' already implemented
    each do |value|
      return value if yield(value)
    end
    nil
  end
end

# x = CustomArray
# x.find {|v| v*v > 200 } 
#
puts "You can always call with_index after an interator"


puts "---------------------------------"

puts """
An enumerator is like an external iterator. 

In C++ iterators are external to the class. Seperate objects, you can pass around.
In Ruby they are internal to the class. You can't pass them around, without passing the object.

On arrays and hashes though you can call the 'to_enum' method that returns an 
enumerator of the object.

The thing is, calling an iterator with no block, often returns an enumerator.
This is then when you call the 'with_index' method, which is short for 'each_with_index';

You can then call 'to_a' on an enumerator to iterate over it and turn it into an array
"""

puts """
Effectively enumerators allow you to control the iteration more carefully, 
by choosing how you iterate over itemsi
"""

enum_in_threes = (1..10).enum_for(:each_slice, 3)
p enum_in_threes.to_a

puts """
Enumerators are more like generators, and iterators like iterators. 
They wait at 'yield'. In a way this makes sense why most iterators without 
a block yield generators (I think? guessing here)
"""

triangular_numbers = Enumerator.new do |yielder|
  number = 0
  count = 1
  loop do # 'loop' loops until nothing left (vague?)
    number += count
    count += 1
    yielder.yield number
  end
end

10.times { print triangular_numbers.next, " " }
p triangular_numbers.first(5)

puts """
Note this doesnt make the iterators explicitly lazy. (ie if you call map or select
on an infinite iterator it will run forever, even if in the next call you just take
the first 5. You can however get built in lazy enumerators, by calling .lazy on an enumerator 
in ruby 2
""" 
puts "---------------------------------"

puts """
You can also use 'yield' and enumerators to open files, much in the same way that you 
can write context_managers in python, using the yield keyword and a @context_manager
(which turns the yield into __enter__ and __exit__) methodsa

Finally Blocks needn't be anonymous. If a function takes a block,the variable name starts
with an ampersand '&var1' in function def, and the block is converted to an object of the 'Proc' class.
"""

class ExampleWithProc
  def pass_in_block(&action)
    @stored_proc = action
  end
  def use_stored_proc(param)
    @stored_proc.call(param)
  end
end

eg = ExampleWithProc.new
eg.pass_in_block {|x| puts "param is #{x}" }
eg.use_stored_proc(99)
eg.use_stored_proc("hey")

puts """
If you call lambda or Proc.new you get an object of class Proc, to which you can assign a variable
(though theres a slight differnece to be learnt later)
"""

# Some syntax sugar
x = lambda { |var1| puts var1}
x = -> var1 { puts var1}

puts "---------------------------------"

puts "Unsurprisingly, if you return a block from a function it can work as a closure"

def n_times(thing)
  lambda {|n| thing * n }
end

x = n_times("hey ")
puts x.call(5)


#some more examples of passing blocks around with syntax sugah

def my_if_statement(condition, then_clause, else_clause)
  if condition
    then_clause.call
  else
    else_clause.call
  end
end

5.times do |val|
  my_if_statement val < 2,    # Note: no brackets, comma for args
    -> {puts "#{val} is small"},
    -> {puts "#{val} is big"}
end


def my_while_statement( cond_proc, &body_block )
   while cond_proc.call # passed in as proc
     body_block.call    # passed in as bloc, converted to proc
   end
end

a = 0
my_while_statement -> { a < 4 } do
  puts a
  a += 1
end



puts "---------------------------------"

puts """
Finally, lambdas, blocs & procs can take argments as a parament list in 
the same way as functions. Can take arg1, *splatArg, &blockarg
"""
#Note splat seems to be basically like *args, you take the rest of arguments as a list
proc1 = lambda do |a, *b, &block|
  puts "a = #{a.inspect}"
  puts "b = #{b.inspect}"
  block.call
end

proc1.call(1,2,3,4) {puts "yo! in block"} # a = 1 ; b =  [2, 3, 4] ; "yo! in block"

proc2 = -> a, *b, &block do 
  puts "a = #{a.inspect}"
  puts "b = #{b.inspect}"
  block.call
end

proc2.call(1,2,3,4) {puts "yo! in block"} # a = 1 ; b =  [2, 3, 4] ; "yo! in block"
