require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/deck'
require './lib/card'
require './lib/round'

class RoundTest < Minitest::Test 
  attr_reader :card_1, :card_2, :card_3, :cards, :deck, :round

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [card_1, card_2, card_3]
    @deck = Deck.new(cards)
    @round = Round.new(deck)
  end

  def test_it_exists
    assert_instance_of Round, round
  end

  def test_it_is_initialized_with_deck
    assert_equal deck, round.deck
  end

  def test_it_is_initialized_with_turns
    assert_equal [], round.turns
  end

  def test_it_is_initialized_with_number_correct
    assert_equal 0, round.number_correct
  end
end