class Complement

  Complement_Map = { dna_to_rna:  {
                       'A' => 'U' ,
                       'T' => 'A' ,
                       'G' => 'C' ,    
                       'C' => 'G' ,
                     } ,
                     rna_to_dna: {
                       'A' => 'T' ,
                       'U' => 'A' ,
                       'C' => 'G' ,
                       'G' => 'C' ,    
                     }
                   }

#This method is for easier debugging
def self.show_map
  @map = Complement_Map
end

def self.of_dna(rna_string)
  rna_compliment = ""
  
  rna_string.each_char { |c| rna_compliment <<  Complement_Map[:rna_to_dna][c] } #raise ArgumentError }
  
  rna_compliment


end


def self.of_rna(dna_string)
  
end


end #class ComplementTest
