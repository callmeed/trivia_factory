require "test_helper"

class TriviaFactoryTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::TriviaFactory::VERSION
  end

  def test_random_question
    question = TriviaFactory::Question.random
    refute_nil question.label
  end

  def test_to_hash
    question = TriviaFactory::Question.new
    assert_kind_of Hash, question.to_h
  end

  def test_csv_fetching
    data = TriviaFactory::Question.fetch_csv('vocabulary')
    assert_kind_of Array, data
  end

  def test_math_question
    question = TriviaFactory::Question.math
    assert_equal question.question_type, :fill_in_the_blank
    assert_equal question.answer_type, :integer
  end

  def test_vocabulary_question
    question = TriviaFactory::Question.vocabulary
    assert_equal question.question_type, :multiple_choice
    assert_equal question.answer_type, :choice_index
    assert_equal question.choices.count, 4
    assert_operator question.answer, :<, question.choices.count
  end

  def test_state_capitals_question
    question = TriviaFactory::Question.us_state_capitals
    assert_equal question.question_type, :multiple_choice
    assert_equal question.answer_type, :choice_index
    assert_equal question.choices.count, 4
    assert_operator question.answer, :<, question.choices.count
  end

  def test_country_capital_question
    skip("Not implemented yet")
  end

  def test_sports_question
    question = TriviaFactory::Question.sports
    assert_equal question.question_type, :multiple_choice
    assert_equal question.answer_type, :choice_index
    assert_equal question.choices.count, 4
    assert_operator question.answer, :<, question.choices.count
    assert_match /NBA|Super Bowl|World Series|Stanley/i, question.label
  end
end
