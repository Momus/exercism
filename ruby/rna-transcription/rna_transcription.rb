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


 

  
  def self.of_dna(dna_string)
    generate_complement(:dna_to_rna, dna_string)
  rescue
    raise ArgumentError, "Uracil not present in DNA"
  end

  
  def self.of_rna(rna_string)
    generate_complement(:rna_to_dna, rna_string)
  rescue
    raise ArgumentError, "Thymine not present in RNA"
  end
  
  
  
 def self.generate_complement(map_index, nucleotide_string)

   # Ennumerate's #each_with_object throws no method errror with strings
   # So a string object is provided:
    complement = ""
    nucleotide_string.each_char { |c| complement <<  Complement_Map[map_index][c]}
    return complement
  
  end

 private_class_method :generate_complement
  
end #class ComplementTest