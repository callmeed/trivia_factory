require "trivia_factory/version"
require "csv"

module TriviaFactory
  class Question

    QUESTION_TYPES = [:true_false, :multiple_choice, :fill_in_the_blank].freeze
    ANSWER_TYPES = [:choice_index, :boolean, :string, :integer].freeze

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

      def question_types
        TriviaFactory.constants.select { |k| TriviaFactory.const_get(k).instance_of?(Class) && k != :Question }
      end

      def random
        klass = question_types.sample
        TriviaFactory.const_get(klass).generate
      end

      def generate
        TriviaFactory::Question.new
      end

      def math
        TriviaFactory::MathQuestion.generate
      end

      def us_state_capitals
        TriviaFactory::UsStateCapitalsQuestion.generate
      end

      def capital_cities
        TriviaFactory::CapitalCitiesQuestion.generate
      end

      def sports
        TriviaFactory::SportsQuestion.generate
      end

      def academy_awards
        TriviaFactory::AcademyAwardsQuestion.generate
      end

      def vocabulary
        TriviaFactory::VocabularyQuestion.generate
      end

      def company
        TriviaFactory::CompanyQuestion.generate
      end

      def grammy_awards
        TriviaFactory::GrammyAwardsQuestion.generate
      end

      def fetch_csv(name)
        file = File.join(File.dirname(__FILE__), "data", "#{name}.csv")
        CSV.read(file)
      end
    end
  end
end

require "trivia_factory/vocabulary_question"
require "trivia_factory/math_question"
require "trivia_factory/sports_question"
require "trivia_factory/us_state_capitals_question"
require "trivia_factory/capital_cities_question"
require "trivia_factory/academy_awards_question"
require "trivia_factory/company_question"
require "trivia_factory/grammy_awards_question"
