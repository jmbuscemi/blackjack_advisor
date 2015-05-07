puts "Let's play blackjack!"
#Define Options Hash
#Hard numbers
hard = Hash.new
(5..21).each {|i| hard[i] = {} }
(5..7).each {|n| (2..11).each {|i| hard[n][i] = "hit"}}
((2..4).to_a + (7..11).to_a).each {|i| hard[8][i] = "hit"}
(5..6).each {|i| hard[8][i] = "DOUBLE DOWN!! Unless you don't have the funds...then just hit"}
(2..6).each {|i| hard[9][i] = "DOUBLE DOWN!! Unless you don't have the funds...then just hit"}
(7..11).each {|i| hard[9][i] = "hit"}
(2..9).each {|i| hard[10][i] = "DOUBLE DOWN!! Unless you don't have the funds...then just hit"}
(10..11).each {|i| hard[10][i] = "hit"}
(2..11).each {|i| hard[11][i] = "DOUBLE DOWN!! Unless you don't have the funds...then just hit"}
((2..3).to_a + (7..11).to_a).each {|i| hard[12][i] = "hit"}
(4..6).each {|i| hard[12][i] = "stay"}
(13..16).each {|n| (2..6).each {|i| hard[n][i] = "stay"}}
(13..16).each {|n| (7..11).each {|i| hard[n][i] = "hit"}}
(17..21).each {|n| (2..11).each {|i| hard[n][i] = "stay"}}

#Soft numbers
soft = Hash.new
(13..21).each {|i| soft[i] = {} }
(13..16).each {|n|
  ((2..3).to_a + (7..11).to_a).each {|i| soft[n][i] = "hit"}
  (4..6).each {|i| soft[n][i] = "DOUBLE DOWN!! Unless you don't have the funds...then just hit"}
}
(2..6).each {|i| soft[17][i] = "DOUBLE DOWN!! Unless you don't have the funds...then just hit"}
(7..11).each {|i| soft[17][i] = "hit"}
((2..2).to_a + (7..8).to_a + (11..11).to_a).each {|i| soft[18][i] = "stay"}
(3..6).each {|i| soft[18][i] = "DOUBLE DOWN!! Unless you don't have the funds...then just stay"}
(9..10).each {|i| soft[18][i] = "hit"}
((2..5).to_a + (7..11).to_a).each {|i| soft[19][i] = "stay"}
(6..6).each {|i| soft[19][i] = "DOUBLE DOWN!! Unless you don't have the funds...then just stay"}
(20..21).each {|n| (2..11).each {|i| soft[n][i] = "stay"}}

#Pairs
pair = Hash.new
(2..11).each {|i| pair[i] = {} }
(2..7).each {|i| pair[2][i] = "split"}
(8..11).each {|i| pair[2][i] = "hit"}
(2..8).each {|i| pair[3][i] = "split"}
(9..11).each {|i| pair[3][i] = "hit"}
((2..3).to_a + (7..11).to_a).each {|i| pair[4][i] = "hit"}
(4..6).each {|i| pair[4][i] = "split"}
(2..9).each {|i| pair[5][i] = "DOUBLE DOWN!! Unless you don't have the funds...then just hit"}
(10..11).each {|i| pair[5][i] = "hit"}
(2..7).each {|i| pair[6][i] = "split"}
(8..11).each {|i| pair[6][i] = "hit"}
(2..8).each {|i| pair[7][i] = "split"}
((9..9).to_a + (11..11).to_a).each {|i| pair[7][i] = "hit"}
(10..10).each {|i| pair[7][i] = "stay"}
(2..11).each  {|i| pair[8][i] = "split"}
((2..6).to_a + (8..9).to_a).each {|i| pair[9][i] = "split"}
((7..7).to_a + (10..11).to_a).each {|i| pair[9][i] = "stay"}
(2..11).each  {|i| pair[10][i] = "stay"}
(2..11).each  {|i| pair[11][i] = "split"}

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
    puts "That's not a card! You must not be old enough to gamble...Goodbye!"
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

if first_value == second_value
  player_move = pair[first_value][dealer_value]
  puts "The math says you should #{player_move}."
  exit
elsif (first_value == 11 || second_value == 11) && (first_value < 10 || second_value < 10)
  player_sum = first_value + second_value
  player_move = soft[player_sum][dealer_value]
  puts "The math says you should #{player_move}."
  exit
elsif (first_value == 11 || second_value == 11) && (first_value == 10 || second_value == 10)
  puts "BLACKJACK! COLLECT YOUR MONEY!!!!"
  exit
else
  player_sum = first_value + second_value
  player_move = hard[player_sum][dealer_value]
  puts "The math says you should #{player_move}."
  exit
end

# puts "First card is #{first_value}"
# puts "Second card is #{second_value}"
# puts "Your sum is #{first_value + second_value}"
# puts "Deale's card is #{dealer_value}"
