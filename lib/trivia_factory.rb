require "trivia_factory/version"
require "csv"

module TriviaFactory
  class Question

    QUESTION_TYPES = [:true_false, :multiple_choice, :fill_in_the_blank].freeze
    ANSWER_TYPES = [:choice_index, :boolean, :string, :integer]

    attr_accessor :label
    attr_accessor :question_type
    attr_accessor :choices
    attr_accessor :answer_type
    attr_accessor :answer

    def initialize
      @label = "Who won the MLB World Series in 2016?"
      @question_type = :multiple_choice
      @choices = ["San Francisco Giants", "Chicago Cubs", "Cleveland Indians", "Golden State Warriors"]
      @answer_type = :choice_index
      @answer = 1
    end

    def to_h
      {
        label: @label,
        question_type: @question_type,
        choices: @choices,
        answer: @answer,
        answer_type: @answer_type
      }
    end

    class << self
      def generate
        question = TriviaFactory::Question.new
      end

      def math(max = 100)
        question = TriviaFactory::Question.new
        rng = Random.new
        first = rng.rand(max)
        second = rng.rand(max)
        question.label = "#{first} + #{second} = _____?"
        question.question_type = :fill_in_the_blank
        question.answer_type = :integer
        question.answer = first + second
        question.choices = []
        question
      end

      def vocabulary
        # File: vocabulary.csv
        # Column 1: word
        # Column 2: definition
        # Format: "Which is the most appropriate definition of the word '[WORD]'?"
        data = fetch_csv('vocabulary')
        answer_row = data.sample
        question = TriviaFactory::Question.new
        question.label = "Choose the correct definition of the word '#{answer_row[0]}'"
        question.choices = [answer_row[1]]
        question.question_type = :multiple_choice
        question.answer_type = :choice_index
        3.times do
          question.choices << data.sample[1]
        end
        question.choices.shuffle!
        question.answer = question.choices.index(answer_row[1])
        question
      end

      def fetch_csv(name)
        file = File.join(File.dirname(__FILE__), "data", "#{name}.csv")
        data = CSV.read(file)
      end
    end
  end
end
