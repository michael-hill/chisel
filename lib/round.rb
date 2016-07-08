
require_relative 'guess'

class Round

  def initialize(deck)
    @deck = deck
    @guesses = []
  end

  def deck
    @deck
  end

  def guesses
    @guesses
  end

  def record_guess(guess)
    @guesses << Guess.new(guess, current_card)
  end

  def current_card
    deck.cards[@guesses.count]
  end

  def number_correct
    number_right = 0
    @guesses.each do |guess|
      if guess.feedback == "Correct!"
        number_right += 1
    end
  end
  number_right
  end

  def percent_correct
    (number_correct/@deck.count) * 100
  end

  def start
    #starts round
  end
end
