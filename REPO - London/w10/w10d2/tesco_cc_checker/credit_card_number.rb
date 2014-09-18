class CreditCardNumber
  attr_reader :number
  
  def initialize(number)
    @number = number.to_s.gsub(/\s/, '')
  end
  
  def valid?
    [
      card_type != "unknown",
      passes_luhn_check?
    ].all?
  end
  
  def card_type
    number_length = @number.size
    # or would regex comparisons be better?.... TODO: benchmark
    case 
    when number_length == 15 && %w(34 37).include?(first_amount_of_digits(2))
      "AMEX"
    when number_length == 16 && first_amount_of_digits(4) == "6011"
      "Discover"
    when number_length == 16 && %w(51 52 53 54 55).include?(first_amount_of_digits(2))
      "MasterCard"
    when [16, 13].include?(number_length) && first_amount_of_digits(1) == "4"
      "Visa"
    else
      "unknown"
    end
  end
  
  private
  def first_amount_of_digits(amount)
    @number[0..(amount-1)]
  end

  private
  def passes_luhn_check?
    # very imperative implementation... TODO: refactor
    intermediate = ""
    @number[0..-2].split("").reverse.each_slice(2) do |e|
      intermediate << (e[0].to_i*2).to_s
      intermediate << e[1].to_s
    end
    intermediate << @number[-1..-1]
    summed_intermediate = intermediate.split("").map(&:to_i).inject { |m,e| m+=e }
    summed_intermediate % 10 == 0
  end
end

