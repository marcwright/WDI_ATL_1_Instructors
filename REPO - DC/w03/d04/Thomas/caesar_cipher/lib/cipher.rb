require 'pry'

class Cipher
  attr_accessor :encryption

  @encryption = {:a => "n", :b => "o", :c => "p", :d => "q", :e => "r", :f => "s", :g => "t", :h => "u", :i => "v", :j => "w", :k => "x", :l => "y", :m => "z", :n => "a", :o => "b", :p => "c", :q => "d", :r => "e", :s => "f", :t => "g", :u => "h", :v => "i", :w => "j", :x => "k", :y => "l", :z => "m"}

  def self.encode(word)
    word1 = word.downcase
    word2 = word1.split("")
    word3 = word2.map {|letter| letter.to_sym}
    word4 = word3.map {|symbol| puts @encryption[symbol]}
    return word4
  end

  encode("hello")

end
