class Turn
  attr_reader :guess, 
              :card

  def initialize(guess, card_arg)
    @guess = guess
    @card = card_arg
  end

  def correct?
    @guess === @card.answer
  end

  def feedback
    if correct?
      'Correct!'
    else 
      'Incorrect!'
    end
  end
end
