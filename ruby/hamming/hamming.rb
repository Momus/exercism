
#Should start by declaring a class, but if a Hamming object will never
#be instantiated, shouldn't this be a module instead?


class Hamming

=begin
What I wanted to do is solve this problem using the same sort
of recursion that I saw in the Little Schemer book, because this
problem really seem to fit that pattern.  Instead, I got completely
stuck.

I used the lambda because without it the methods became out of scope
for the block.  However, I can't seem to get the counter to count as
the block iterates.  I've tried referencing it and returning it in
different places in the blocks.  I tried to make it a class variable,
even a global variable to see if scope was the problem. 

I've been staring at this for hours, so if someone would nudge me in
the right direction, I would be very grateful. 

Dmitri
=end

  ##Disguising Ruby strings as Scheme lists 
  def s_car(string)
    string[0]
  end
  
  def s_cdr(string)
    string = string[1..-1] if string
  end

   
  def self.compute(first_sequence, second_sequence)
      if first_sequence.length  != second_sequence.length
        raise ArgumentError, 'Hamming number only defined for sequences of same length'
      else
        counter = 0
        comp =  lambda do
          if s_car(first_sequence) != s_car(second_sequence)
            counter += 1
          end
          first_sequence  = s_cdr(first_sequence) 
          second_sequence  = s_cdr(second_sequence)
          if first_sequence
            comp(first_sequence, second_sequence)
          end
        
        end
        return counter
      end
      
  end
  
end #class Hamming
