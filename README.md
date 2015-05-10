# Blackjack Advisor
This program will take information about a current blackjack hand and return the
optimal action for the player to take.  It stores the set of optimal moves for a
1 deck blackjack hand, asks the user for his or her current hand
(and the dealer's up card), and then give the user his or her optimal move.

### Features
* Face cards can be input by using letters (J,Q,K,A) or words
  (Jack, Queen, etc.) and case does not matter
* Low cards are input using numbers 1-10
* If a user enters something that is not an actual card, the program will exit
  (because children should not be practicing blackjack)
* Soft hands consist of an ace with a non-face card
* User can choose between 1, 2, or 4+ decks
