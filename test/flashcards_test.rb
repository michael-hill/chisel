gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/flashcards'

class CardTest < Minitest::Test
  def test_does_card_have_a_question
    card = Card.new("In what year did the war of 1812 begin?", "1812")
    assert_equal "In what year did the war of 1812 begin?", card.question
  end

  def test_does_card_have_an_answer
    card = Card.new("In what year did the war of 1812 begin?", "1812")
    assert_equal "1812", card.answer
  end
end
