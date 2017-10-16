module TriviaFactory
  class CompanyQuestion < Question

    class << self
      def generate
        # File: sp_500.csv
        # Column 0: ticker
        # Column 1: company name
        # Column 2: sector
        # Column 3: sub sector
        # Column 4: HQ location
        data = fetch_csv('sp_500')
        answer_row = data.sample
        question = TriviaFactory::Question.new
        question.label = "Headquartered in #{answer_row[4]}, this public company has the ticker symbol #{answer_row[0]}"
        question.choices = [answer_row[1]]
        question.question_type = :multiple_choice
        question.answer_type = :choice_index
        loop do
          row = data.sample
          question.choices << row[1] if question.choices.index(row[1]).nil?
          break if question.choices.size == 4
        end
        question.choices.shuffle!
        question.answer = question.choices.index(answer_row[1])
        question
      end
    end

  end
end
