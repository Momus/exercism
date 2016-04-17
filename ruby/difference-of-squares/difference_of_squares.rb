

  class Squares

    def initialize number

      @number = number
      
    end

    
    def sum_of_squares

      next_num = 0
      output = 0

      @number.times do
        next_num += 1
        output = output + (next_num ** 2)
      end

      output
      
    end

    
    def square_of_sums
           
      next_num = 0
      output = 0

      @number.times do
        next_num += 1
        output = output + next_num
      end

      output**2
      
    end

    
    def difference

     square_of_sums - sum_of_squares 
      
    end

    
  end
  
