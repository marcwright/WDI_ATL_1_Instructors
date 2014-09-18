class Shirt
attr_accessor :size, :color, :text
  def initialize(size, color, text)
    @size = size
    @color = color
    @text = text

  end

  def show_shirt
    puts "I love my #{self.size} #{self.color} because it says #{self.text}!"

  end
end

pearl_jam_t = Shirt.new('extra-large', 'black', 'Yield Tour 1998')
hipster_plaid = Shirt.new('medium', 'red', "NO LOGO")
david_beckham_jersey = Shirt.new('large', 'white', 'Beckham')


pearl_jam_t.show_shirt
hipster_plaid.show_shirt
david_beckham_jersey.show_shirt
