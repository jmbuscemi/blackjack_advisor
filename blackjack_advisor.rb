puts "Let's play blackjack!"
puts "How many decks (1, 2, or 4+)? "
number_decks = gets.chomp.to_i

#Define Options Hash
#Hard numbers
hard = Hash.new()
(5..21).each {|i| hard[i] = Hash.new("hit")}
if number_decks == 1
  (5..6).each {|i| hard[8][i] = "DOUBLE DOWN!! Unless you don't have the funds...then just hit"}
  (2..6).each {|i| hard[9][i] = "DOUBLE DOWN!! Unless you don't have the funds...then just hit"}
  (2..11).each {|i| hard[11][i] = "DOUBLE DOWN!! Unless you don't have the funds...then just hit"}
elsif number_decks == 2
  (2..6).each {|i| hard[9][i] = "DOUBLE DOWN!! Unless you don't have the funds...then just hit"}
  (2..11).each {|i| hard[11][i] = "DOUBLE DOWN!! Unless you don't have the funds...then just hit"}
elsif number_decks >= 4
  (3..6).each {|i| hard[9][i] = "DOUBLE DOWN!! Unless you don't have the funds...then just hit"}
  (2..10).each {|i| hard[11][i] = "DOUBLE DOWN!! Unless you don't have the funds...then just hit"}
end
(2..9).each {|i| hard[10][i] = "DOUBLE DOWN!! Unless you don't have the funds...then just hit"}
(4..6).each {|i| hard[12][i] = "stay"}
(13..16).each {|n| (2..6).each {|i| hard[n][i] = "stay"}}
(17..21).each {|n| (2..11).each {|i| hard[n][i] = "stay"}}

#Soft numbers
soft = Hash.new()
(13..21).each {|i| soft[i] = Hash.new("hit")}
if number_decks == 1
  (13..14).each {|n|
    (4..6).each {|i| soft[n][i] = "DOUBLE DOWN!! Unless you don't have the funds...then just hit"}
  }
  (2..6).each {|i| soft[17][i] = "DOUBLE DOWN!! Unless you don't have the funds...then just hit"}
  ((2..2).to_a + (7..8).to_a + (11..11).to_a).each {|i| soft[18][i] = "stay"}
  ((2..5).to_a + (7..11).to_a).each {|i| soft[19][i] = "stay"}
  (6..6).each {|i| soft[19][i] = "DOUBLE DOWN!! Unless you don't have the funds...then just stay"}
else
  (13..14).each {|n|
    (5..6).each {|i| soft[n][i] = "DOUBLE DOWN!! Unless you don't have the funds...then just hit"}
  }
  (3..6).each {|i| soft[17][i] = "DOUBLE DOWN!! Unless you don't have the funds...then just hit"}
  ((2..2).to_a + (7..8).to_a).each {|i| soft[18][i] = "stay"}
  (2..11).each {|i| soft[19][i] = "stay"}
end
(15..16).each {|n|
  (4..6).each {|i| soft[n][i] = "DOUBLE DOWN!! Unless you don't have the funds...then just hit"}
}
(3..6).each {|i| soft[18][i] = "DOUBLE DOWN!! Unless you don't have the funds...then just stay"}
(20..21).each {|n| (2..11).each {|i| soft[n][i] = "stay"}}

#Pairs
pair = Hash.new()
(2..11).each {|i| pair[i] = Hash.new("split")}
if number_decks == 1
  (9..11).each {|i| pair[3][i] = "hit"}
  ((2..3).to_a + (7..11).to_a).each {|i| pair[4][i] = "hit"}
  (8..11).each {|i| pair[6][i] = "hit"}
  ((9..9).to_a + (11..11).to_a).each {|i| pair[7][i] = "hit"}
  (10..10).each {|i| pair[7][i] = "stay"}
elsif number_decks == 2
  (8..11).each {|i| pair[3][i] = "hit"}
  ((2..4).to_a + (7..11).to_a).each {|i| pair[4][i] = "hit"}
  (8..11).each {|i| pair[6][i] = "hit"}
  (9..11).each {|i| pair[7][i] = "hit"}
elsif number_decks >= 4
  (8..11).each {|i| pair[3][i] = "hit"}
  ((2..4).to_a + (7..11).to_a).each {|i| pair[4][i] = "hit"}
  (7..11).each {|i| pair[6][i] = "hit"}
  (8..11).each {|i| pair[7][i] = "hit"}
end

(8..11).each {|i| pair[2][i] = "hit"}
(2..9).each {|i| pair[5][i] = "DOUBLE DOWN!! Unless you don't have the funds...then just hit"}
(10..11).each {|i| pair[5][i] = "hit"}
((7..7).to_a + (10..11).to_a).each {|i| pair[9][i] = "stay"}
(2..11).each  {|i| pair[10][i] = "stay"}

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

def player_move(first_value, second_value, dealer_value, hard, soft, pair)
  if first_value == second_value
    puts "The math says you should " + pair[first_value][dealer_value]
  elsif (first_value == 11 || second_value == 11) && (first_value < 10 || second_value < 10)
    player_sum = first_value + second_value
    puts "The math says you should " + soft[player_sum][dealer_value]
  elsif (first_value == 11 || second_value == 11) && (first_value == 10 || second_value == 10)
    puts "BLACKJACK! COLLECT YOUR MONEY!!!!"
  else
    player_sum = first_value + second_value
    puts "The math says you should " + hard[player_sum][dealer_value]
  end
end

puts "Please enter your 1st card (1-10, J, Q, K, A): "
first_value = evaluate_card(gets.chomp.downcase).to_i
puts "Please enter your 2nd card (1-10, J, Q, K, A): "
second_value = evaluate_card(gets.chomp.downcase).to_i
puts "Please enter the dealer's up card (1-10, J, Q, K, A): "
dealer_value = evaluate_card(gets.chomp.downcase).to_i

player_move(first_value, second_value, dealer_value, hard, soft, pair)
