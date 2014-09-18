class Apartment
  attr_accessor :name, :price, :bedrooms, :bathrooms, :tenants

  def initialize(name, price, bedrooms, bathrooms)
    @name = name
    @price = price
    @bedrooms = bedrooms
    @bathrooms = bathrooms
    @tenants = []
  end

  def is_occupied?
    self.tenants.any?
  end

  def to_s
    "#{@name} has #{@bedrooms} bedrooms and #{bathrooms} bathrooms and #{tenants.size} tenants\n" + super
  end

end
