module TriviaFactory
  class UsStateCapitalsQuestion < Question

    class << self
      def generate
        # File: us_state_capitals.csv
        # Column 1: state
        # Column 2: city
        # Format: "Which is the most appropriate definition of the word '[WORD]'?"
        data = fetch_csv('us_state_capitals')
        answer_row = data.sample
        question = TriviaFactory::Question.new
        question.label = "#{answer_row[1]} is the capital of what US state?"
        question.choices = [answer_row[0]]
        question.question_type = :multiple_choice
        question.answer_type = :choice_index
        3.times do
          question.choices << data.sample[0]
        end
        question.choices.shuffle!
        question.answer = question.choices.index(answer_row[0])
        question
      end
    end

  end
end
