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



