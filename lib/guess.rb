
class Guess
  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def card
    @card
  end

  def response
    @guess
  end

  def correct
    if @guess == card.answer
      puts "Correct!"
    else
      puts "Incorrect."
    end
  end
end
