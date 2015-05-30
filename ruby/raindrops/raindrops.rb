 module  Raindrops

   def self.convert(number)
     outstring = ""
     case
     when number.modulo(3) == 0
       count = 0
       num = number
       until num.modulo(3) != 0
         count += 1
         num = num / 3
         outstring << "Pling"
       end
       outstring
     else number.to_s
     end
     
        
   end

 
  
 end #Raindrops
