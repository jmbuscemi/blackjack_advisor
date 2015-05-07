puts "Let's play blackjack!"
#Define Options Hash
#Hard numbers
hard = Hash.new
(5..21).each {|i| hard[i] = {} }
(5..7).each {|n| (2..11).each {|i| hard[n][i] = "Hit"}}
((2..4).to_a + (7..11).to_a).each {|i| hard[8][i] = "Hit"}
(5..6).each {|i| hard[8][i] = "Double Down!"}
(2..6).each {|i| hard[9][i] = "Double Down!"}
(7..11).each {|i| hard[9][i] = "Hit"}
(2..9).each {|i| hard[10][i] = "Double Down!"}
(10..11).each {|i| hard[10][i] = "Hit"}
(2..11).each {|i| hard[11][i] = "Double Down"}
((2..3).to_a + (7..11).to_a).each {|i| hard[12][i] = "Hit"}
(4..6).each {|i| hard[12][i] = "Stay"}
(13..16).each {|n| (2..6).each {|i| hard[n][i] = "Stay"}}
(13..16).each {|n| (7..11).each {|i| hard[n][i] = "Hit"}}
(17..21).each {|n| (2..11).each {|i| hard[n][i] = "Stay"}}

#Soft numbers
soft = Hash.new
(13..21).each {|i| soft[i] = {} }
(13..16).each {|n|
  ((2..3).to_a + (7..11).to_a).each {|i| soft[n][i] = "Hit"}
  (4..6).each {|i| soft[n][i] = "Double Down!"}
}
(2..6).each {|i| soft[17][i] = "Double Down!"}
(7..11).each {|i| soft[17][i] = "Hit"}
((2..2).to_a + (7..8).to_a + (11..11).to_a).each {|i| soft[18][i] = "Stay"}
(3..6).each {|i| soft[18][i] = "Double Down!"}
(9..10).each {|i| soft[18][i] = "Hit"}
((2..5).to_a + (7..11).to_a).each {|i| soft[19][i] = "Stay"}
(6..6).each {|i| soft[19][i] = "Double Down!"}
(20..21).each {|n| (2..11).each {|i| soft[n][i] = "Stay"}}

#Pairs
pair = Hash.new
(2..11).each {|i| pair[i] = {} }
(2..7).each {|i| pair[2][i] = "Split"}
(8..11).each {|i| pair[2][i] = "Hit"}
(2..8).each {|i| pair[3][i] = "Split"}
(9..11).each {|i| pair[3][i] = "Hit"}
((2..3).to_a + (7..11).to_a).each {|i| pair[4][i] = "Hit"}
(4..6).each {|i| pair[4][i] = "Split"}
(2..9).each {|i| pair[5][i] = "Double Down!"}
(10..11).each {|i| pair[5][i] = "Hit"}
(2..7).each {|i| pair[6][i] = "Split"}
(8..11).each {|i| pair[6][i] = "Hit"}
(2..8).each {|i| pair[7][i] = "Split"}
((9..9).to_a + (11..11).to_a).each {|i| pair[7][i] = "Hit"}
(10..10).each {|i| pair[7][i] = "Stay"}
(2..11).each  {|i| pair[8][i] = "Split"}
((2..6).to_a + (8..9).to_a).each {|i| pair[9][i] = "Split"}
((7..7).to_a + (10..11).to_a).each {|i| pair[9][i] = "Stay"}
(2..11).each  {|i| pair[10][i] = "Stay"}
(2..11).each  {|i| pair[11][i] = "Split"}



def evaluate_card(card)
  low_cards = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10",]
  face_cards = ["j", "jack", "q", "queen", "k", "king"]
  ace_cards = ["a", "ace"]
  if face_cards.include?(card)
    10
  elsif ace_cards.include?(card)
    11
  elsif low_cards.include?(card)
    card
  else
    puts "That's not a card! You're must not be old enough to gamble...Goodbye!"
    exit
  end
end


puts "Please enter your 1st card (1-10, J, Q, K, A): "
  first_card = gets.chomp.downcase
  first_value = evaluate_card(first_card).to_i
puts "Please enter your 2nd card (1-10, J, Q, K, A): "
  second_card = gets.chomp.downcase
  second_value = evaluate_card(second_card).to_i
puts "Please enter the dealer's up card (1-10, J, Q, K, A): "
  dealer_card = gets.chomp.downcase
  dealer_value = evaluate_card(dealer_card).to_i


puts "First card = #{first_value}"
puts "Second card = #{second_value}"
puts "Your sum is #{first_value + second_value}"
puts "Dealer card = #{dealer_value}"
