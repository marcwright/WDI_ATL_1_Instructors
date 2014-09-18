require 'pry'

def calc_area(length,width)
  return length * width
end

def calc_vol(length, width, height)
  return length * width * height
end

def sings_fav_lyric(lyric1)
  binding.pry
  return lyric1.upcase + "!!!!"
end

binding.pry
