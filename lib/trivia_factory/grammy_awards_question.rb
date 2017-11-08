module TriviaFactory
  class GrammyAwardsQuestion < Question

    class << self
      def generate
        # File: grammy_awards.csv
        # 0: award
        # 1: winner
        # 2: album
        # 3: year
        data = fetch_csv('grammy_awards')
        answer_row = data.sample
        question = TriviaFactory::Question.new
        question.label = "In #{answer_row[3]} #{answer_row[1]} won the grammy award for #{answer_row[0]} for which album?"
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
