gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require'./lib/flashcards'

class DeckTest < Minitest::Test
  def test_deck_has_cards_in_it
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars")
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west")
    card_4 = Card.new("What is 5 + 1?", "10")
    deck = Deck.new([card_1, card_2, card_3, card_4])
    assert_equal [card_1, card_2, card_3, card_4] , deck.cards
  end

  def test_deck_has_card_count
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars")
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west")
    card_4 = Card.new("What is 5 + 1?", "10")
    deck = Deck.new([card_1, card_2, card_3, card_4])
    assert_equal 4, deck.count
  end
end
