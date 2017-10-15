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
