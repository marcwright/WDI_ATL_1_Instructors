class Golf
  
  class << self
    i = 0
    '
v.reduce :*
        
[*(?a..?z)]
        
(1..v).reduce :*
        
v.map { |e|
  e =~ /^m/ ? "hat(#{e})" : e =~ /^(d.*).$/ ? "#{$1}(bone))" : (e[0..2] = "dead"
  e)
}
        
v.reduce [] { |m, e| i=v.index(e)
  m + v.each_cons(i+1).to_a}
        
(1..v).map { |i|
  s = ""
  s << "fizz" if i % 3 < 1 
  s << "buzz" if i % 5 < 1
  s[0] ? s : i
}
        
v.reduce([]) { |m, e|
  ((n=m[-1]) && n[-1]) == e-1 ? n << e : m << [e]
  m
  }.map { |m| 
    [m[0],m[-1]].uniq.join(?-) 
  }
        
s = [1,1]
(v-2).times { |j| s << s[j] + s[j + 1] }
s
        
v.split.map { |w| w[4..-4] = ?.*3 if w.size > 10
  w }.join " "
    '.split("        ").map {|e| 
    eval "def hole#{i+=1} v=0 #{e}end"}
  end
end