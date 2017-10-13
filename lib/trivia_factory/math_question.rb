module TriviaFactory
  class MathQuestion < Question

    QUESTION_SUB_TYPES = [:addition, :subtraction, :multiplication, :division].freeze

    class << self
      def generate(max = 100)
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
    end

  end
end
