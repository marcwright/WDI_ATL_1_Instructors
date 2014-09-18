class Array
require 'pry'
  def bubble_sort
    return self if self.size <= 1 # an array of size 1 is already sorted
    swapped = true
    while swapped do
      swapped = false
      1.upto(self.size-1) do |i|
        if self[i-1] > self[i]
          self[i-1], self[i] = self[i], self[i-1] #this swaps them
          swapped = true #remember there was a swap
        end
      end
    end
    self
  end

  def quick_sort()
    return self if self.length <= 1
    # less, equal, greater := three empty arrays
    less = []
    greater = []
    pivot = self.shift
    # if length(array) > 1
      # pivot := select any element of array

  #     for each x in array
    self.each do |number|
    # if x < pivot then add x to less
    # if x = pivot then add x to equal
    # if x > pivot then add x to greater
      less << number if number <= pivot
      greater << number if number >= pivot
    end

    less.quick_sort + [pivot] + greater.quick_sort
  end
end
