class Hand
  def initialize(cards)
    @cards = cards
  end

  def values
    values_array = []

    @cards.each do |card|
      value = card[0]

      case value
      when "A"
        values_array << 1
      when "T"
        values_array << 10
      when 'J'
        values_array << 11
      when "Q"
        values_array << 12
      when "K"
        values_array << 13
      else
        values_array << value.to_i
      end

    end

    values_array.sort
  end

  def suits
    current_hand = Array.new

    for card in @cards do
      current_hand << card.split("")[1]
    end

    current_hand
  end

  def straight?
    is_straight = true

    values.each_with_index do |value, index|
      is_straight = false if index > 0 && value != (values[index - 1] + 1)
    end

    is_straight
  end

  def flush?
    is_flush = true

    suits.each_with_index do |suit, index|
      is_flush = false if index > 0 && suit != (suits[index - 1])
    end

    is_flush
  end

  def full_house?

    if values.count(values[0]) == 2 && values.count(values[-1]) == 3
      true
    elsif values.count(values[-1]) == 2 && values.count(values[0]) == 3
      true
    else
      false
    end
  end

  def four_of_a_kind?
    if values[0] == values[1] && values[1] == values[2] && values[2] == values[3]
      true
    elsif values[1] == values[2] && values[2] == values[3] && values[3] == values[4]
      true
    else
      false
    end
  end

  def best_hand
    is_straight = true

    values.each_with_index do |value, index|
      is_straight = false if index > 0 && value != (values[index - 1] + 1)
    end

    is_flush = true

    suits.each_with_index do |suit, index|
      is_flush = false if index > 0 && suit != (suits[index - 1])
    end

    if is_straight && is_flush
      'Straight Flush'
    elsif four_of_a_kind?
      "Four of a Kind"
    elsif full_house?
      "Full House"
    elsif flush?
      'Flush'
    elsif straight?
      "Straight"
    else
      "Not much"
    end
  end

end
