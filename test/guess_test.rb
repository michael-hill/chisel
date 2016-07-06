gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'
require'./lib/flashcards'

class GuessTest < Minitest::Test
  def test_guess_is_given_for_question
    card = Card.new("In what year did the war of 1812 begin?", "1812")
    guess = Guess.new("1812", card)
  end

  def test_card_guess
    card = Card.new("In what year did the war of 1812 begin?", "1812")
    guess = Guess.new("1812", card)
    assert_equal "In what year did the war of 1812 begin?", guess.card.question
    assert_equal "1812", guess.response
  end

  def test_if_there_is_a_response
    card = Card.new("In what year did the war of 1812 begin?", "1812")
    guess = Guess.new("1812", card)
    assert_equal "1812", guess.response
  end

  def test_if_guess_is_correct
    card = Card.new("In what year did the war of 1812 begin?", "1812")
    guess = Guess.new("1812", card)
    assert_equal "1812", guess.response
  end


end
