def pe4(digits)
  is_palin = lambda { |x| x.to_s == x.to_s.reverse }
  two_d_array = (1..(10**digits)).to_a.product((1..10**digits).to_a)
  return two_d_array.map { |x|
    x.reduce(:*)
  }.select(&is_palin).max
end

print pe4 3