class Location
  attr_accessor :postcode, :apartments, :affluency, :nearest_tube

  def initialize(postcode)
    @postcode = postcode
    @apartments = []
  end

  def to_s
    "#{postcode} has #{affluency} affluency, and is near #{nearest_tube}. There are #{apartments.size} apartments.\n" + super
  end

end