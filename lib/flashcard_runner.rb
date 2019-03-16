require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
cards = [card_1, card_2, card_3]
deck = Deck.new(cards)
round = Round.new(deck)

round.start
count = deck.cards.count

until deck.count == 0
  puts "This is card number #{round.turns.count + 1} out of #{count}"
  puts "Question: #{round.current_card.question}"
  print "Answer: "
  user_answer = gets.chomp
  turn = round.take_turn(user_answer) 
  puts turn.feedback
  puts ''
end

puts "****** Game Over! ******"
puts "You had #{round.number_correct} correct guesses out of #{count} for a total score of #{round.percent_correct}%"


