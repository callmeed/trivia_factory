module TriviaFactory
  class SportsQuestion < Question

    QUESTION_SUB_TYPES = [:champions, :mvps].freeze

    class << self
      def generate
        question = TriviaFactory::Question.new
        question
      end
    end

  end
end
