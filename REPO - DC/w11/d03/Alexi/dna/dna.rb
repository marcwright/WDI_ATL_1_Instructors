require 'pry'

class Dna
attr_reader :strand
# 

  def initialize(strand)
    @strand = strand
  end

  def unique_bases
    strand.split(//).uniq
  end

  def num_unique_bases
    unique_bases.length
  end

  def num_bases(letter)
    strand.count(letter)
  end

  def base_hash
    base_hash = {}
    unique_bases.each do |base|
      base_hash["#{base}"] = "#{num_bases(base)}"
    end
    base_hash
  end

  def compliment
    hash = {'G' => 'C', 'A' => 'T', 'C' => 'G', 'T' => 'A'} 
    array = strand.split(//).reverse.map do |base|
      hash[base]
    end
    array.join
  end
end # END of Class

dna = Dna.new("GTCA")
# puts dna.unique_bases
puts dna.num_bases('A')
puts dna.base_hash
puts dna.compliment
