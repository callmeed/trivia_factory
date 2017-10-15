module TriviaFactory
  class CapitalCitiesQuestion < Question

    class << self
      def generate
        # File: capital_cities.csv
        # Column 1: city
        # Column 2: country
        data = fetch_csv('capital_cities')
        answer_row = data.sample
        question = TriviaFactory::Question.new
        question.label = "#{answer_row[0]} is the capital city of what country?"
        question.question_type = :fill_in_the_blank
        question.answer_type = :string
        question.answer = answer_row[1]
        question.choices = []
        question
      end
    end

  end
end
