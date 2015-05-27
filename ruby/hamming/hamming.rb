

=begin
module MicroScheme
    
  def r_car(list_like_object)
    list_like_object[0]
  end
  
  def r_cdr(list_like_object)
    list_like_object = list_like_object[1..-1] if list_like_object
  end

end
=end

class Hamming

  def self.compute(first_sequence, second_sequence)
    result_string = "" 
    #   include MicroScheme
    if first_sequence.length  != second_sequence.length
      raise ArgumentError, 'Hamming number only defined for sequences of same length'
    else
      loop  do
        result_string =  first_sequence[0]  if first_sequence && first_sequence[0]  != second_sequence[0]
        first_sequence[0]  = second_sequence[0]  = ""
        break first_sequence.empty?
      end 
    end
    
    result_string.length

  end #compute
  
  
end #class Hamming
