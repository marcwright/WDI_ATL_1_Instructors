# Stephen Stanwood (stephen@stanwoodsolutions.com)

class Cipher
  # Encodes a string by shifting each of its characters 13 places forward
  def self.encode(string)
    return string.chars.map do |c|
      13.times { c.succ! }
      c[-1]
    end.join
  end

  # This version adds a test to work for strings that include spaces
  # def self.encode(string)
  #   res = string.chars.map do |c|
  #     c == " " ? " " : ((c.ord - 96 + 13) % 26 + 96).chr
  #   end

  #   return res.join
  # end
end
