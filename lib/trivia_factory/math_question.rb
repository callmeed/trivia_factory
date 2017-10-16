module TriviaFactory
  class MathQuestion < Question

    QUESTION_SUB_TYPES = [:addition, :subtraction, :multiplication, :division].freeze

    def initialize(subtype = :addition)
      @question_type = :fill_in_the_blank
      @answer_type = :integer
      @choices = []
      raise 'Invalid sub type for TriviaFactory::MathQuestion' unless QUESTION_SUB_TYPES.include?(subtype)
      self.send("build_#{subtype.to_s}")
    end

    def build_addition
      rng = Random.new
      first = rng.rand(100)
      second = rng.rand(100)
      @label = "#{first} + #{second} = _____?"
      @answer = first + second
    end

    def build_subtraction
      rng = Random.new
      first = rng.rand(100)
      second = rng.rand(100)
      @label = "#{first + second} - #{first} = _____?"
      @answer = second
    end

    def build_multiplication
      rng = Random.new
      first = rng.rand(12)
      second = rng.rand(12)
      @label = "#{first} X #{second} = _____?"
      @answer = first * second
    end

    def build_division
      rng = Random.new
      first = 1 + rng.rand(11)
      second = 1 + rng.rand(11)
      @label = "#{first * second} ÷ #{first} = _____?"
      @answer = second
    end

    class << self
      def generate
        sub_type = QUESTION_SUB_TYPES.sample
        question = TriviaFactory::MathQuestion.new(sub_type)
        question
      end
    end

  end
end
