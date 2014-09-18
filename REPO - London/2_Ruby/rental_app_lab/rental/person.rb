class Person
  attr_accessor :name, :phone, :sex, :apartment

  def initialize(name, phone, sex, apartment=nil)
    @name = name
    @phone = phone
    @sex = sex
    @apartment = apartment
  end

  def to_s
    "#{name} is #{sex}, and can be contacted on #{phone}\n" + super
  end

end
