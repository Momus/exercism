class Hamming

  def self.compute(_1st_sequence, _2nd_sequence)
    if !(_1st_sequence.length  == _2nd_sequence.length)
      raise ArgumentError, 'Sequences must be of same length'
    elsif _1st_sequence == _2nd_sequence
      0
    else
      false
    end
    
  end
  
end
