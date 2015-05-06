puts "Let's play blackjack!"

def evaluate_card(card)
  face_cards = ["jack" , "j" , "queen" , "q" , "king" , "k"]
  ace_cards = ["a", "ace"]
  if face_cards.include?(card)
    10
  elsif ace_cards.include?(card)
    11
  else
    card
  end
end

puts "Please enter your 1st card: "
  first_card = gets.chomp.downcase
  first_value = evaluate_card(first_card).to_i
puts "Please enter your 2nd card: "
  second_card = gets.chomp.downcase
  second_value = evaluate_card(second_card).to_i
puts "Please enter the dealer's up card: "
  dealer_card = gets.chomp.downcase
  dealer_value = evaluate_card(dealer_card).to_i


puts "First card = #{first_value}"
puts "Second card = #{second_value}"
puts "Your sum is #{first_value + second_value}"
puts "Dealer card = #{dealer_value}"
