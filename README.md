# Trivia Factory

Ruby gem for creating sample trivia/test questions. Intended for use in specs (like Faker) or apps that need questions.

## Installation

*Coming soon (gem not published yet)*

## Usage

Sample question (not random yet):

```

> question = TriviaFactory::Question.generate
>
> question.to_h
> {
>   label: "Who won the MLB World Series in 2016?",
>   question_type: :multiple_choice,
>   choices: ["San Francisco Giants", "Chicago Cubs", "Cleveland Indians", "Golden State Warriors"],
>   answer_type: :choice_index,
>   answer: 1
> }

```

Basic math question (addition of random integers):

```

> question = TriviaFactory::Question.math(10)
> 
> question.to_h
> {
>   label: "5 + 3 = _____?",
>   question_type: :fill_in_the_blank,
>   choices: [],
>   answer_type: :integer,
>   answer: 8
> }

```
