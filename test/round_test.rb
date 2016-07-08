require 'pry'
gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/round'
require './lib/deck'
require'./lib/flashcards'

class RoundTest < Minitest::Test
  def test_round_is_setup
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal round.deck, deck
  end

  def test_round_has_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal [],round.guesses
  end

  def test_current_card_first_card_of_deck
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal card_1, round.current_card

    assert_instance_of Guess, round.record_guess("Juneau").first
    assert_equal 1, round.guesses.count
    assert_equal "Correct!", round.guesses.first.feedback
    assert_equal 1, round.number_correct
    assert_equal card_2, round.current_card
  end

  def test_incorrect_guesses
  card_1 = Card.new("What is the capital of Alaska?", "Juneau")
  card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
  deck = Deck.new([card_1, card_2])
  round = Round.new(deck)
  round.record_guess ("Juneau")
  round.record_guess ("3")
  assert_equal "Incorrect.", round.guesses[1].feedback
  assert_equal 2, round.guesses.count
  assert_equal 1, round.number_correct
  end

  def test_program_returns_percentage_correct
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess ("Juneau")
    round.record_guess ("93,000,000")
    assert_equal 100, round.percent_correct
  end

  def test_round_can_record_guess
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_instance_of Guess, round.record_guess("Juneau").first
  end
end
