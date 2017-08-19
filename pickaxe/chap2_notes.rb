puts " ----------------------- " 
puts """
Whitespace and naming conventions:
- New lines matter, indenting doesnt (but do x2)
- lower_snake    -> local vars, method names, method params 
- @amp_start     -> instance variables
- @@double_amp   -> class variables
- $dollar_start  -> global vars
- UpperCamel     -> class names (required)
- UPPERCASE      -> constant

"""

puts " ----------------------- " 

x = nil # is our version of None
puts "Nil is the new None. Use p instead of puts to print it"
puts "puts nil :", x
p "p nil: ", x # explicitly prints nil

puts " ----------------------- " 

# 'hash' is our dict
musical_instruments = {
  'cello'   => 'string',
  'clarine' => 'woodwind',
  'drum'    => 'percussion',
  'oboe'    => 'woodwind'
} 


puts "Hashes have a slightly different syntax, return nil if dont exist:"
p "p musical_instruments['cello']: ",  musical_instruments['cello']
p "p musical_instruments['car']: ", musical_instruments['car'] # returns nil

puts
puts "Our hash: ",   musical_instruments.inspect

musical_instruments.member?('cello') # true

mi_2 = Hash.new("nope")
mi_2['hello'] # nope 

puts " ----------------------- " 
 
puts "Arrays are our lists."
puts "They are very similar, but there is syntax sugar in some cases"

p  [1, "two", nil]
array_of_string_animals = %w{ ant bee cat dog elk }
puts array_of_string_animals

puts " ----------------------- " 

puts """
Instead of enums, like

NORTH = 1
EAST = 2
SOUTH = 3
WEST = 4

ruby has 'symbols'.  Start with a :colon, and are guaranteed to be unique

eg:  walk(:north)
or:  if direction == :north # do blah

Note you can use them as keys in Hashes, and you get some syntax sugar.

eg: 
x = { north: 'Go Up', east: 'Go Left'} 
x[:north] # 'Go Up'

"""

p :hello # p prints :hello, puts print hello
x = {hello: 'world'}
p x[:hello]

puts " ----------------------- " 

puts """The usual control structures are terminated with 'end'.
This makes sense as there is no strict indenting
"""

today = Time.now

if today.saturday?
  puts "today it's Saturday"
elsif today.sunday?
  puts "today it's Sunday"
else
  puts "its a workday"
end

puts "Here is a fizz buzz"

i = 1 
while i < 20
  if i % 3 == 0 and i % 5 == 0
    print "fizzbuzz "
  elsif i % 3 == 0
    print "fizz "
  elsif i % 5 == 0
    print "buzz "
  else
    print i, " "
  end
  i += 1
end

puts """Note in ruby, most statements return something.
Ie x = 5 actually returns 5.

This means you can do stuff like:

while line = gets
  puts line.downcase
end
"""

puts """
For one-line statements in 'if' or 'while' you can use a statement modifier

eg: puts 'hey' if x == 3
eg: square = square*square while square < 5
"""

puts " ----------------------- "

puts """Ruby has built in regex objects, between /here/, and the =~ operator
returns start postion of found pattern or nil"""

puts "Type a word with hello in it for it to be printed"
line = gets

if line =~ /hello/
  print line
else
  print "shame..."
end

print "Subbing hello for bye...:  ", line.sub(/hello/, 'bye')

puts " ----------------------- "

puts """
Ruby also has chunks of code that can be associated with a method invocation.
These are either in braces, or between do and end.

eg:
{puts 'Hello'}
or:
do
  puts 'Howdy'
  puts 'Hi Hi'
end

There are subtle differences (brackets bind more tightly) but convention is
multiline use 'do/end' otherwise braces

If you put a brace after a method invocation, the block will be executed, whenever
the keyword yield is called. You can pass it args, and they are captures in |pipes| 

def call_block
  puts 'begin'
  yield 1
  yield 4
  puts 'end
end

# now call

call_block {|no| print 'in block ', no}

# begin
# in block 1
# in block 4
# end

This effectively becomes a way of doing callbacks and anonymous functions.
"""

['cat', 'dog', 'horse'].each {|name| print name, " " }
5.times { print "*" }
3.upto( 6 )  { |i| print i }

# Also has haskell's incremental completion
('a'..'e').each {|c| print c}

puts " ----------------------- "

puts "Command line args covered in thw exercises."
puts "File IO is also covered in thw exercises"
