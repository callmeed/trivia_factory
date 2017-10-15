# Trivia Factory

Ruby gem for creating sample trivia/test questions. Intended for use in specs (like Faker) or apps that need questions.

## Installation

`gem install trivia_factory`

If you're using Bundler and/or Rails, add the following to your Gemfile:

`gem 'trivia_factory'`

## Usage

### Generate a random question (from all available types)

`question = TriviaFactory::Question.random`

This will return a `TriviaFactory::Question` object. Use the `to_h` helper to get it as a hash.

```
question.to_h

{
            :label => "Sacramento is the capital of what US state?",
    :question_type => :multiple_choice,
          :choices => [
            "Oklahoma",
            "Delaware",
            "California",
            "Oregon"
          ],
           :answer => 2,
      :answer_type => :choice_index
}
```

### Question object structure

Question objects have the following attributes (which are also available as keys in the hash):

**label**: this is the actual question being asked

**question_type**: a symbol denoting the type of question. Will be one of the following: `[:true_false, :multiple_choice, :fill_in_the_blank]`

**choices**: an array of choices for multiple choice questions. Will be an empty array (not `nil`) for other question types.

**answer**: the correct answer for the question. Its type/class may vary (see below).

**answer_type**: specifies the type of answer. Will be one of the following: `[:choice_index, :boolean, :string, :integer]`. *Note*: when `:choice_index`, the correct answer corresponds to the correct choice in the `choices` array.

### Question categories

Currently the following question categories exist as subclasses of `TriviaFactory::Question`:

**TriviaFactory::MathQuestion**

**TriviaFactory::SportsQuestion**

**TriviaFactory::UsStateCapitalsQuestion**

**TriviaFactory::VocabularyQuestion**
