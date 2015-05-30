 module  Raindrops

   def self.convert(number)
     outstring = ""
     outstring << "Pling" if number.modulo(3) == 0 
     outstring << "Plang" if number.modulo(5) == 0 
     outstring << "Plong" if number.modulo(7) == 0
     outstring[0] ? outstring : number.to_s
     end
 
  
 end #Raindrops
