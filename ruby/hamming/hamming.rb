=begin
Should start by declaring a class, but if a Hamming object will never
be instantiated, shouldn't this be a module instead?
=end

class Hamming

=begin
This is wrong, but lets face it, Lisp list functions
are pretty handy.  So my first exercise in Ruby will feature a
minuscule subset of an implementation of Common Lisp.
=end

  def self.car(list)
    list[0]
  end
  
  def self.cdr(list)
    list = list[1..-1] if list
  end

  def cons(atom, list)
    list.unshift(atom) if list.is_a? Array
  end

  
 @counter = 0  
 
 def self.calc_distance(one_array, two_array)
      if one_array.length  != two_array.length
      raise ArgumentError, 'Hamming number only defined for sequences of same length'
    elsif
      if car(one_array) != car(two_array)
       @counter = @counter +  1
      end
      next_1  = cdr(one_array) 
      next_2  = cdr(two_array)
      calc_distance(next_1, next_2) if next_1
    end

      return @counter
  end

  def self.compute(_1st_sequence, _2nd_sequence)
   _1st_sequence = _1st_sequence.split("")
   _2nd_sequence = _2nd_sequence.split("")
   self.calc_distance(_1st_sequence, _2nd_sequence)
 end

end
