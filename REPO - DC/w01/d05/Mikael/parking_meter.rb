class Parking_meter

  def initialize(quarters)
    @time = quarters * 30
    MAX_VALUE = 120
  end

  def add_time(quarters)
    @time = @time + quarters * 30
    if @time > MAX_VALUE
      @time = MAX_VALUE
    end
    return @time
  end

  #specifies number of minutes remaining
  def get_time_remaining

  end


  def test_expired?

  end

  def test_maxed?

  end






end
