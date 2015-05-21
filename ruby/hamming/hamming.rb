
#Should start by declaring a class, but if a Hamming object will never
#be instantiated, shouldn't this be a module instead?


class Hamming

=begin
What I wanted to do is solve this problem using 

 
=end

  ##My "micro Scheme implementation" 
  def self.car(list)
    list[0]
  end
  
  def self.cdr(list)
    list = list[1..-1] if list
  end


  
  @counter = 0  
 
  def self.calc_distance(one_array, two_array)
      if one_array.length  != two_array.length
        raise ArgumentError, 'Hamming number only defined for sequences of same length'
      else
        (car(one_array) != car(two_array)) ?  @counter += 1 : @counter  
        one_array  = cdr(one_array) 
        two_array  = cdr(two_array)
        calc_distance(one_array, two_array) if one_array
      end
      
      return @counter
  end

  def self.arrayize(string)
    array = string.split("")
  end
  
  def self.compute(first_sequence, second_sequence)
    one_array = arrayize(first_sequence)
    two_array = arrayize(second_sequence)
    calc_distance(one_array, two_array)
  end
  
end
