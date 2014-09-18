class Hand

  def initialize(cards)
    @cards = cards
  end

  def values
    fav_numbers = []
    @cards.each do |mycard|
      value = mycard[0]
      if value == "A"
        fav_numbers << 1
      elsif value == "T"
        fav_numbers << 10
      elsif value == 'J'
        fav_numbers.push(11)
      elsif value =="Q"
        fav_numbers << 12
      elsif value == "K"
        fav_numbers.push(13)
      else
        fav_numbers.push(value.to_i)
      end
    end
    return fav_numbers
  end

  def suits
    mycardarray = Array.new
    @cards.each do |value, index|
      mycardarray << value.split("")[1]
    end
    return mycardarray
  end

  def straight
    ordered_values = values.sort
    straight = true
    ordered_values.each_with_index do |value, index|
      if index > 0 && value != (ordered_values[index - 1] + 1)
        straight = false
      end
    end
    return straight
  end

  def flush
    flush = true
    suits.each_with_index do |suit, index|
      if index > 0 && suit != (suits[index - 1])
        flush = false
      end
    end
    return flush
  end

  def full_house
    full_house = true
    ordered_values = values.sort
    if values.count(ordered_values[0]) == 2 && values.count(ordered_values[-1]) == 3
        full_house = true
    elsif values.count(ordered_values[-1]) == 2 && values.count(ordered_values[0]) == 3
        full_house = true
    else
        full_house = false
    end
    return full_house
  end

  def four_of_a_kind
    four_of_a_kind = true
    ordered_values = values.sort
    if ordered_values[0] == ordered_values[1] && ordered_values[1] == ordered_values[2] && ordered_values[2] == ordered_values[3]
      four_of_a_kind = true
    elsif ordered_values[1] == ordered_values[2] && ordered_values[2] == ordered_values[3] && ordered_values[3] == ordered_values[4]
      four_of_a_kind = true
    else
      four_of_a_kind = false
    end
    return four_of_a_kind
  end

  # def best_hand
  #   ordered_values = values.sort
  #   is_straight = true
  #   ordered_values.each_with_index do |value, index|
  #     if index > 0 && value != (ordered_values[index - 1] + 1)
  #       is_straight = false
  #     end
  #   end
  #   return best_hand
  # end

  # def flush
  #   is_flush = true
  #   suits.each_with_index do |suit, index|
  #     if index > 0 && suit != (suits[index - 1])
  #       is_flush = false
  #     end
  #   end
  #   return flush
  # end

  # GAME BEHAVIOR

  if straight
    "Straight"
  elsif flush
    'Flush'
  elsif four_of_a_kind
    "Four of a Kind"
  elsif full_house
    "Full House"
  else
    "Not much"
  end

end



