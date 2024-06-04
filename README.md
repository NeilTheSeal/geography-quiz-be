# Geography Quiz Back-End
> A fun online quiz to test your knowledge of world geography

![Ruby][ruby-image]
![Rails][rails-image]

This is the back end to the **Geography Quiz** web application made by students at [Turing School of Programming and Design](https://turing.edu) over the course of two weeks. The back end is an API [deployed on Heroku](https://ancient-plains-68209-663b50393b93.herokuapp.com) and uses PostgreSQL to store user scores and quiz data. The quiz questions are randomly generated using data from the [REST Countries API](https://restcountries.com). Each quiz is 20 questions and there is a high scores list displaying the most knowledgable folks. The front end of this project is open source and [available on GitHub.](https://github.com/NeilTheSeal/geography-quiz-fe)

## Example API requests

<details>
 <summary><code>GET</code> <code>/quiz-questions</code></summary>


##### Parameters

> | name      |  type     | data type               | description                                                           |
> |-----------|-----------|-------------------------|-----------------------------------------------------------------------|
> | None      |  N/A | N/A   | N/A  |

##### Headers

> | name      |  type     | data type               | description                                                           |
> |-----------|-----------|-------------------------|-----------------------------------------------------------------------|
> | accept      |  optional | string   | application/json  |

##### Responses

> | http code     | content-type                      | response                                                            |
> |---------------|-----------------------------------|---------------------------------------------------------------------|
> | `201`         | `application/json`        | `[{question: "example question", answer: "example answer"}, ...]`                                |
> | `400`         | `application/json`                | `{"code":"400", "message":"Bad Request"}`                            |                                                  |

##### Example cURL

> ```javascript
>  curl -X GET -H "accept: application/json" https://ancient-plains-68209-663b50393b93.herokuapp.com/quiz-questions
> ```
</details>

## Q&A

- Example question 1
  - Example answer 1

- Example question 2
  - Example answer 2

## Development setup

The back-end of this project uses Ruby on Rails 7.1.3 and was built using macOS Sonoma 14.4.1.

First, clone the repository to your computer

```sh
git clone git@github.com:NeilTheSeal/geography-quiz-be.git
```

Next, install all of the Gems

```sh
bundle install
```

Finally, start the development server

```sh
rails s
```

The API will be served on `localhost:5000`.

## Release History

* 0.0.1
    * Work in progress

## Meta

Neil Hendren | [NeiltheSeal](https://github.com/NeiltheSeal) | neil.hendren@gmail.com | [LinkedIn](https://www.linkedin.com/in/neilhendren/)

Luis Aparicio | [LuisAparicio14](https://github.com/luisaparicio14) | lfelipeaparicio2004@gmail.com | [LinkedIn](https://www.linkedin.com/in/luis-aparicio14/)

Rodrigo Chavez - [RodrigoACG](https://github.com/RodrigoACG) | Rodrigo103004@gmail.com | [LinkedIn](http://www.linkedin.com/in/rodrigo-chavez1)

Distributed under the MIT license. See ``LICENSE.txt`` for more information.

## Contributing

Email any author to inquire about contributing.

<!-- Markdown link & img dfn's -->
[ruby-image]: https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white
[rails-image]: https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white

