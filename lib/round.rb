class Round 
  attr_reader :deck, :turns, :number_correct

  def initialize(deck_arg)
    @deck = deck_arg
    @turns = []
    @number_correct = 0
  end

  def start
    puts "Welcome! You're playing with #{deck.cards.count} cards."
    puts '-------------------------------------------------'
  end

  def current_card
    deck.cards[0]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns.push(new_turn)

    if new_turn.correct?
      @number_correct += 1
    end

    deck.cards.shift
    return new_turn
  end

  def number_correct_by_category(category)
    correct_answers = @turns.find_all do |turn|
      turn.card.category === category && turn.correct?
    end

    correct_answers.length
  end

  def percent_correct
    (@number_correct / turns.length.to_f * 100).round(0)
  end

  def percent_correct_by_category(category)
    number_correct = @turns.find_all do |turn|
      turn.card.category === category && turn.correct?
    end

    total = @turns.find_all do |turn|
      turn.card.category === category
    end

    number_correct.length.to_f / total.length * 100 
  end
end