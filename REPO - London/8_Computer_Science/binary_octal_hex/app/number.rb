class Number
  # def self.bin2dec(binary)
  #   binary.reverse.split("").each_with_index.map{|c, i| (c.to_i) * (2**i)}.reduce(:+)
  # end

  # def self.dec2bin(number)
  #   binary = []
  #   Math.log2(number).ceil.times do
  #     quotient = number / 2
  #     binary << (number % 2).to_s
  #     number = quotient
  #   end
  #   binary.reverse.join
  # end

  # def self.bin2hex(binary)
  #   hexes = []
  #   binary = binary.split('')

  #   if (binary.count % 4) != 0
  #     missing = 4 - (binary.size % 4)
  #     missing.times {binary.unshift('0')}
  #   end

  #   (binary.size / 4).times do
  #     quad = binary.pop(4).join

  #     hexes.unshift case quad
  #       when '0000' then '0'
  #       when '0001' then '1'
  #       when '0010' then '2'
  #       when '0011' then '3'
  #       when '0100' then '4'
  #       when '0101' then '5'
  #       when '0110' then '6'
  #       when '0111' then '7'
  #       when '1000' then '8'
  #       when '1001' then '9'
  #       when '1010' then 'a'
  #       when '1011' then 'b'
  #       when '1100' then 'c'
  #       when '1101' then 'd'
  #       when '1110' then 'e'
  #       when '1111' then 'f'
  #     end
  #   end
  #   hexes.join
  # end

end