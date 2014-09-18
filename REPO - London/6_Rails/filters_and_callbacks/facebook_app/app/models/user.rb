class User < ActiveRecord::Base
  attr_accessible :dob, :name

  before_save :do_before_save
  around_save :do_around_save
  after_save :do_after_save

  before_save :capitalise_postcodes

def capitalise_postcodes
  self.postcode = postcode.to_s.upcase
end

  def do_before_save
    puts "before save"
  end


  def do_after_save
    puts 'after save'
  end

  def do_around_save
    puts 'around save'
    yield
    puts 'done around save'
  end

end
