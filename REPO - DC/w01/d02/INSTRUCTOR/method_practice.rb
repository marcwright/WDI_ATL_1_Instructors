require 'pry'

def calc_area(length, width)
  return length * width
end

marp = "darp"

def calc_vol(length, width, height)
  return length * width * height
end

def sings_fav_lyric(fav_lyric)
  binding.pry
  return fav_lyric.upcase + "!!!!!!!!"
end


