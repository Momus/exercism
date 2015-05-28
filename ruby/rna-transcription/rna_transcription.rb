#All tests passing

class Complement

  dna_string = ""
  
  
  def self.of_dna(dna_input_string)
    rna_string = ""
    #Can't keep it a string 'cause we need the index
    dna_array = dna_input_string.split('')
    
    dna_array.each_index do | index |
      case
      when dna_array[index] == "G" then  rna_string[index] = "C"
      when dna_array[index] == "C" then  rna_string[index] = "G"
      when dna_array[index] == "T" then  rna_string[index] = "A"
      when dna_array[index] == "A" then  rna_string[index] = "U"
      when dna_array[index] == "U" then raise ArgumentError, "Uricil not found in DNA"
      end
    end
      return  rna_string
  end

  def self.of_rna(rna_input_string)
    dna_string = ""
    rna_array = rna_input_string.split('')

    rna_array.each_index do |index|
      case
      when rna_array[index] == "G" then  dna_string[index] = "C"
      when rna_array[index] == "C" then  dna_string[index] = "G"
      when rna_array[index] == "U" then  dna_string[index] = "A"
      when rna_array[index] == "A" then  dna_string[index] = "T"
      when rna_array[index] == "T" then raise ArgumentError, "Thiamine not found in RNA"
      end
    end
    return dna_string
  end
  
end #class ComplementTest
