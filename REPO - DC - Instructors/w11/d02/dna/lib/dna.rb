dna = "GCTCGATCGATCTAGCTAGCATGATAATCGATGATCTAGCCGGGCCCTTAGCGGATCTAGCATCGATCGACTCGATCGAGCGCTAGCTACGATCAG"

# 1) How many unique bases (letters)?
dna.split("").uniq.length

# 2) How many "A" bases?
dna.split("").count("A")

# 3) How many unique, non-overlaping, complete "octets"? (octet = group of 8 bases)


# 4) In DNA strings, symbols 'A' and 'T' are complements of each other, as are 'C' and 'G'.
# The reverse complement of a DNA string s is the string formed by first reversing the symbols of s, then taking the complement of each symbol
# (e.g., the reverse complement of "GTCA" is "TGAC").

def complement(nucleotide)
  case nucleotide
  when "A"
    "T"
  when "T"
    "A"
  when "G"
    "C"
  when "C"
    "G"
  end
end
reversed = dna.reverse.each_char.map {|n| complement(n)}.join

# 6) How many unique octets exist for the DNA bases?


# Take the string "Done is better than perfect" and reverse the order of the words. Final output should be "Perfect than better is done