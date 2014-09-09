def rps(first, second)
   beats = {
    "rock" => "scissors",
    "scissor" => "paper",
    "paper" => "rock"
  }

  if beats[first[:play]] == second[:play]
    "#{first[:name]} wins!"
  elsif first[:play] == second[:play]
    "Tie!"
  else
    "#{second[:name]} wins!"
  end
end