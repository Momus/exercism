=begin
Stolen from @rmetzler who claims to have stole it from others.
=end

module Complement

  DNA_nucleotide = "GCTA"
  RNA_nucleoride = "CGAU"
  
  def self.of_dna(strand)
    nucleotide_check("U", strand)
    strand.tr DNA_nucleotide, RNA_nucleoride
  end
  
  def self.of_rna(strand)
    nucleotide_check("T", strand)
    strand.tr RNA_nucleoride, DNA_nucleotide
  end


  def self.nucleotide_check(nucleotide, strand)
    wrong_place = strand =~ /#{nucleotide}/
    wrong_place ? raise(ArgumentError, "Wrong nucleotide in position #{(wrong_place + 1).to_s}") : strand
  end
  
end #class ComplementTest
