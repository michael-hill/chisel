class Deck

  attr_reader :cards

  def initialize(deck)
    @cards = deck
  end

  def count
    @cards.size
  end
end
