require 'set'

def gems comps
  s = comps[0]
  comps.each { |comp| s &= comp }
  s.length
end

comps = []
gets.chomp.to_i.times do
  comps.push(Set.new(gets.chomp.scan(/\w/)))
end

puts gems comps
