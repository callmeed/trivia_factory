module TriviaFactory
  class VocabularyQuestion < Question

    class << self
      def generate
        # File: vocabulary.csv
        # Column 1: word
        # Column 2: definition
        # Format: "Which is the most appropriate definition of the word '[WORD]'?"
        data = fetch_csv('vocabulary')
        answer_row = data.sample
        question = TriviaFactory::VocabularyQuestion.new
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
    end
    
  end
end
