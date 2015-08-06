=begin
Stolen from @rmetzler who claims to have stole it from others.
=end

module Complement

  DNA_NUCLEOTIDES = "GCTA"
  RNA_NUCLEOTIDES = "CGAU"
  
  def self.of_dna(strand)
    nucleotide_check("U", strand)
    strand.tr DNA_NUCLEOTIDES, RNA_NUCLEOTIDES
  end
  
  def self.of_rna(strand)
    nucleotide_check("T", strand)
    strand.tr RNA_NUCLEOTIDES, DNA_NUCLEOTIDES
  end

  private
  
  def self.nucleotide_check(nucleotide, strand)
    
    if (strand =~ /#{nucleotide}/)
    then
      raise(ArgumentError, "Wrong nucleotide in sequence")
    end
    
  end
  
end #class ComplementTest
