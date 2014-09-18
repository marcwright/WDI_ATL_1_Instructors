class Hotel
  def initialize(doubles, singles)
    @rooms = []
    @capacity = 0
    @guestbook = []

    doubles.times do
      @rooms << Room.new(2)
      @capacity += 2
    end

    singles.times do
      @rooms << Room.new(1)
      @capacity += 1
    end
  end

  def report
    vacancy_count = 0
    @rooms.each { |room| vacancy_count += room.capacity unless room.occupied? }
    puts "#{@rooms.length} rooms with space for #{@capacity} people. #{vacancy_count} vacancies."
    show_guestbook
    puts "------"
  end

  def check_in_single(guest)
    puts "Checking in #{guest}..."
    #room = @rooms.select { |r| not r.occupied? }.first
    single_rooms = @rooms.select {|r| r.single? and not r.occupied? }
    if single_rooms.length > 0
      room = single_rooms.first
    else
      room = @rooms.select {|r| not r.occupied? }.first
    end
    room.add guest
    @guestbook << guest.name
  end

  def show_guestbook
    @guestbook.each {|name| puts "#{name} stayed in our hotel." }
  end


end

class Visitor
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    @name
  end
end

class Room
  attr_reader :capacity

  def initialize(capacity)
    @people = []
    @capacity = capacity
  end

  def occupied?
    @people.length > 0
  end

  def single?
    @capacity == 1
  end

  def add(guest)
    @people << guest
    @capacity -= 1
  end
end

motel = Hotel.new(3, 2)
puts motel.report

tim = Visitor.new("Tim")
max = Visitor.new("Max P")
clem = Visitor.new("Clem")

motel.check_in_single tim
puts motel.report
motel.check_in_single max
motel.check_in_single clem
puts motel.report
