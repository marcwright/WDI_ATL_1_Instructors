require 'pry'


def bubble_sort(array)
  list = array.clone
  count = 0
  return list if list.size <= 1 # already sorted

  loop do
    swapped = false
    0.upto(list.size-2) do |i|
      j = i+1
      if list[i] > list[j]
        list[i], list[j] = list[j], list[i] # swap values
        swapped = true
      end
      count+=1
    end
    break unless swapped
  end

  # puts count
  list
end

def quicksort(list, p=nil, r=nil)
  p ||= 0
  r ||= list.length-1

  if p < r then
    q = partition(list, p, r)
    quicksort(list, p, q-1)
    quicksort(list, q+1, r)
  end
end

def partition(list, p, r)
  pivot = list[r]
  i = p - 1
  (p...r).each do |j|
    if list[j] <= pivot
      i = i+1
      list[i], list[j] = list[j],list[i]
    end
  end
  list[i+1],list[r] = list[r],list[i+1]
  i + 1
end



def random_num
  rand(1_000_000)
end

a=(0...10).map{random_num}.shuffle
b=(0...100).map{random_num}.shuffle
c=(0...1_000).map{random_num}.shuffle
d=(0...10_000).map{random_num}.shuffle
e=(0...100_000).map{random_num}.shuffle
f=(0...1_000_000).map{random_num}.shuffle

require 'benchmark'
def benchmark_sort(array)
  array.sort!
  Benchmark.bmbm do |bm|
    bm.report("bubble") do
      bubble_sort(array.clone)
    end
    bm.report("quick sort") do
      quicksort(array.clone)
    end
    bm.report("ruby sort") do
      array.clone.sort
    end
  end
end


binding.pry
