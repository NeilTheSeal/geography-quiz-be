# Geography Quiz Back-End
> A fun online quiz to test your knowledge of world geography

![Ruby][ruby-image]
![Rails][rails-image]

This is the back end to the **Geography Quiz** web application made by students at [Turing School of Programming and Design](https://turing.edu) over the course of two weeks. The back end is an API [deployed on Heroku](https://ancient-plains-68209-663b50393b93.herokuapp.com/api/v0) and uses PostgreSQL to store user scores and quiz data. The quiz questions are randomly generated using data from the [REST Countries API](https://restcountries.com). Each quiz is 20 questions and there is a high scores list displaying the most knowledgable folks. The front end of this project is open source and [available on GitHub](https://github.com/NeilTheSeal/geography-quiz-fe).

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
> | `200`         | `application/json`        | `{"data": [{"id":"0","type":"questions","attributes":{"question":"...","correct_answer":"...","options":["..."],"image": false}}, ...]}`                                |

##### Example cURL

> ```javascript
>  curl -X GET -H "accept: application/json" "https://ancient-plains-68209-663b50393b93.herokuapp.com/api/v0/quiz-questions"
> ```
</details>

<details>
 <summary><code>GET</code> <code>/high-scores</code></summary>


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
> | `200`         | `application/json`        | `{"data":[{"id":"1","type":"high_scores","attributes":{"user_id":"...","number_correct":15,"created_at":"2024-06-06T00:00:00Z"}}, ...]}`                                |
> | `304`         | `application/json`        | `(same as above)`                                |

##### Example cURL

> ```javascript
>  curl -X GET -H "accept: application/json" "https://ancient-plains-68209-663b50393b93.herokuapp.com/api/v0/high-scores"
> ```
</details>

<details>
 <summary><code>GET</code> <code>/previous-scores</code></summary>


##### Parameters

> | name      |  type     | data type               | description                                                           |
> |-----------|-----------|-------------------------|-----------------------------------------------------------------------|
> | user_id      |  required | string   | the user id as recorded in the front-end database  |

##### Headers

> | name      |  type     | data type               | description                                                           |
> |-----------|-----------|-------------------------|-----------------------------------------------------------------------|
> | accept      |  optional | string   | application/json  |

##### Responses

> | http code     | content-type                      | response                                                            |
> |---------------|-----------------------------------|---------------------------------------------------------------------|
> | `200`         | `application/json`        | `{"data":[{"id":"1","type":"high_scores","attributes":{"user_id":"...","number_correct":15,"created_at":"2024-06-06T00:00:00Z"}}, ...]}`                                |
> | `304`         | `application/json`        | `(same as above)`                                |                            |

##### Example cURL

> ```javascript
>  curl -X GET -H "accept: application/json" "https://ancient-plains-68209-663b50393b93.herokuapp.com/api/v0/previous-scores?user_id=0123456789"
> ```
</details>

<details>
 <summary><code>POST</code> <code>/high-scores</code></summary>


##### Parameters

> | name      |  type     | data type               | description                                                           |
> |-----------|-----------|-------------------------|-----------------------------------------------------------------------|
> | user_id      |  required | string   | the user id as recorded in the front-end database  |
> | number_correct     |  required | integer   | the number of questions that were correct on the quiz  |

##### Headers

> | name      |  type     | data type               | description                                                           |
> |-----------|-----------|-------------------------|-----------------------------------------------------------------------|
> | accept      |  optional | string   | application/json  |

##### Responses

> | http code     | content-type                      | response                                                            |
> |---------------|-----------------------------------|---------------------------------------------------------------------|
> | `302`         | `none`        | `(redirect to user dashboard or home page)`                                |                              |

##### Example cURL

> ```javascript
>  curl -X GET -H "accept: application/json" "https://ancient-plains-68209-663b50393b93.herokuapp.com/api/v0/high-scores?user_id=0123456789&number_correct=5"
> ```
</details>

## Database Schema

There is one table in the back-end database - the quiz results table.

### Quiz Results

| Column         | Data Type |  Required  |
|----------------|-----------|------------|
| user_id        | string    |     true   |
| number_correct | integer   |     true   |
| created_at     | datetime  |     true   |
| updated_at     | datetime  |     true   |

## Q&A

- What is the purpose of this application?
  - This application generates random questions for [the front end](https://github.com/NeilTheSeal/geography-quiz-fe) of this application. It also stores user scores and returns the high scores list.

- Do I need an API key to use this?
  - No, but there is no practical use for this API aside from communicating with the front-end application.

## Development setup

This guide assumes you have installed [Rails 7.1.3](https://guides.rubyonrails.org/v7.1/getting_started.html) and [PostgreSQL >= 14](https://www.postgresql.org/download/)

First, clone the repository to your computer

```sh
git clone git@github.com:NeilTheSeal/geography-quiz-be.git
```

Next, install all of the Gems

```sh
bundle install
```

Create, migrate, and seed the databases

```sh
rails db:{create,migrate,seed}
```

Finally, start the development server

```sh
rails s
```

The API will be served on `localhost:5000`.

Run the test suite to diagnose issues -

```sh
bundle exec rspec
```

## Release History

* 0.0.1
    * Initial deployment 06/07/2024

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

