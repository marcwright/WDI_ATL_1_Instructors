class Fib
  def self.fib(start=0, max=5)
    previous = []
    (0..max).each do |val|
      previous[val] ||= case val
      when 0; 0
      when 1; 1
      else
        previous[val-2] + previous[val-1]
      end
    end
    puts (start..max).map{|val| previous[val]}.inspect

  end
end


Fib.fib 0,20
