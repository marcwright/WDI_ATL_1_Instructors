# Robot (abstract)
class Robot
  def initialize
    @name = 'Marvin'
  end

  def speak
    return get_speaking_quote(get_random_index)
  end

  protected
  
  def get_speaking_quote(index)
    return "Hello .. I am .. #{@name}"
  end

  private

  def get_random_index
    return Random.new.rand(3)
  end
end