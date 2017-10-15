# Trivia Factory

Ruby gem for creating tons of sample trivia/test questions. Intended for use in specs or apps that need questions.
Think of it as [Faker](https://github.com/stympy/faker) for trivia questions.

Originally part of a sports trivia app I had that was somewhat popular (Hat Trick), this gem uses tables of data (in CSV form) to
create random questions.

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

**question_type**: a symbol denoting the type of question. Will be one of the following:

* :true_false
* :multiple_choice
* :fill_in_the_blank

**choices**: an array of choices for multiple choice questions. Will be an empty array (not `nil`) for other question types.

**answer**: the correct answer for the question. Its type/class may vary (see below).

**answer_type**: specifies the type of answer. Will be one of the following: `[:choice_index, :boolean, :string, :integer]`. *Note*: when `:choice_index`, the correct answer corresponds to the correct choice in the `choices` array.

### Question categories

Currently the following question categories exist as subclasses of `TriviaFactory::Question`:

**TriviaFactory::MathQuestion**: generates a basic integer addition problem (fill in the blank).

**TriviaFactory::SportsQuestion**: generates a sports trivia question (multiple choice).

**TriviaFactory::UsStateCapitalsQuestion**: generates a question about US state capitals.

**TriviaFactory::VocabularyQuestion**: generates a multiple choice vocabulary *word* <-> *definition* question. From a list of 1,000 vocabulary study words.

To create a question from any of these types, simply call the `generate()` method on any of the classes.

### More examples

```
# Math question can accept a max param that can limit the size of operands
q = TriviaFactory::MathQuestion.generate(20)
q.to_h
=>  {
      :label         => "5 + 5 = _____?",
      :question_type => :fill_in_the_blank,
      :choices       => [],
      :answer        => 10,
      :answer_type   => :integer
    }
```

```
q = TriviaFactory::SportsQuestion.generate
q.to_h
=> {
      :label         => "In 1987 who defeated the St. Louis Cardinals to win the World Series?",
      :question_type => :multiple_choice,
      :choices       => ["Detroit Tigers", "Minnesota Twins", "Anaheim Angels", "New York Yankees"],
      :answer        => 1,
      :answer_type   => :choice_index
    }
```

## Contributing

Contributions welcome. Add a CSV to the data/ folder, create a subclass, write a test, and submit a PR.
