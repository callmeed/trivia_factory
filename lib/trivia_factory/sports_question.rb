module TriviaFactory
  class SportsQuestion < Question

    QUESTION_SUB_TYPES = [:champions, :mvps].freeze

    class << self
      def generate
        # File: vocabulary.csv
        # 0: year
        # 1: championship ("wold series")
        # 2: counter/number ("IV" for super bowl)
        # 3: winner
        # 4: loser
        # Format: "Who defeated the [LOSER] to win (the) [YEAR] [CHAMPIONSHIP]?"
        question = TriviaFactory::Question.new
        data = fetch_csv('sports_champions')
        answer_row = data.sample
        question = TriviaFactory::VocabularyQuestion.new
        if answer_row[2].nil?
          question.label = "In #{answer_row[0]} who defeated the #{answer_row[4]} to win the #{answer_row[1]}?"
        else
          question.label = "In #{answer_row[0]} who defeated the #{answer_row[4]} to win #{answer_row[1]} #{answer_row[2]}?"
        end
        question.choices = [answer_row[3]]
        question.question_type = :multiple_choice
        question.answer_type = :choice_index
        context_data = data.select {|row| row[1] == answer_row[1] }
        loop do
          row = context_data.sample
          question.choices << row[3] if question.choices.index(row[3]).nil?
          break if question.choices.size == 4
        end
        question.choices.shuffle!
        question.answer = question.choices.index(answer_row[3])
        question
      end
    end

  end
end
