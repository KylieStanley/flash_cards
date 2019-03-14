require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test 
  attr_reader :turn, :card

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new('Juneau', card)
  end

  def test_it_exists
    assert_instance_of Turn, turn
  end

  def test_it_has_a_card
    assert_equal card, turn.card
  end

  def test_it_has_a_guess
    assert_equal 'Juneau', turn.guess
  end

  def test_it_returns_true_if_guess_is_correct
    assert_equal true, turn.correct?
  end

  def test_it_returns_correct_feedback
    assert_equal 'Correct!', turn.feedback
  end

  def test_it_returns_false_if_guess_is_incorrect
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new('Saturn', card)

    assert_equal false,  turn.correct?
  end

  def test_it_returns_incorrect_feedback
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new('Saturn', card)

    assert_equal 'Incorrect!', turn.feedback
  end
end