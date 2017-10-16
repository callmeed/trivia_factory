module TriviaFactory
  class AcademyAwardsQuestion < Question

    class << self
      def generate
        # File: academy_awards.csv
        # 0: award
        # 1: winner
        # 2: movie
        # 3: year
        question = TriviaFactory::Question.new
        data = fetch_csv('academy_awards')
        answer_row = data.sample
        question.label = "In #{answer_row[3]} #{answer_row[1]} won the academy award for #{answer_row[0]} for what film?"
        question.choices = [answer_row[2]]
        question.question_type = :multiple_choice
        question.answer_type = :choice_index
        loop do
          row = data.sample
          question.choices << row[2] if question.choices.index(row[2]).nil?
          break if question.choices.size == 4
        end
        question.choices.shuffle!
        question.answer = question.choices.index(answer_row[2])
        question
      end
    end

  end
end
