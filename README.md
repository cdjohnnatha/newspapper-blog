# Newspapper-blog

The intention to make a blog was changed to something similar as newspapper, passed by a test followed bellow. The newspapper-blog it is a backend application developed in Ruby on Rails 5.

## Table of Contents

<!-- vscode-markdown-toc -->

- 1. [Demo](#Demo)
- 2. [Requirements](#Requirements)
- 3. [Installation](#Installation)
- 4. [The Challenge](#TheChallenge)
  - 4.1. [Goal](#Goal)
  - 4.2. [Screenshots](#Screenshots)
- 5. [Why React?](#WhyReact)
- 6. [Methodology](#Methodology)
  - 6.1. [Accessibility](#Accessibility)
  - 6.2. [Form Validation](#FormValidation)
  - 6.3. [Components](#Components)
- 7. [Technology Stack](#TechStack)
- 8. [References](#References)


## 2. <a name='Requirements'></a>Requirements
- [Ruby on Rails](https://rubyonrails.org/)
- [Docker](https://www.docker.com/)

## 3. <a name='Installation'></a>Installation
1. First, clone this repo.

```bash
git clone https://github.com/cdjohnnatha/newspapper-blog.git
```

2. Installation, is possible to choose one of the ways of installations.
     1. Docker.
     2. Ruby on Rails.

* Docker
 Install by Docker, just run in you terminal/bash:
  ```bash
  docker-compose up -d
  docker-compose run web make createdb
  docker-compose run web make migrations
  docker-compose run web make db_seed
  make yarn-install
  ```

* Ruby on rails
  It is possible to use all the rails commands.
  **Install [postgresdb](https://www.postgresql.org/download/) or user docker to run the postgres using 'make build_postgresdb'**
  ```bash
  bundle install
  make yarn-install
  rails db:create
  rails db:migrate
  rails db:seed
  rails s
  ```

## 4. <a name='TheChallenge'></a>The Challenge

The API design must use the best practices described in the next hackernoon publication.
Some of the most important things in the publication are:
Endpoints must use the corresponding HTTP verbs for every action:
GET for retrieve data from server.
POST for create a new server resource.
PUT for update a server resource.
DELETE for remove a resource.
Server responses must use the HTTP status codes for the corresponding response:
2xx for a successful response.
4xx for not found resources.
5xx for error responses.
Use the API versioning prefix.
You could use the search, ordering, filtering and pagining recommendation if you want.
YOU MUST validate the payload with every request (check for correct values, datatypes and params schema).
All the data must be stored using a RELATIONAL database, anyone, choose the one you like and makes your job easier.
All the queries to the database must use FUNCTIONS, STORED PROCEDURES or a similar mechanism.
Authentication must use JSON Web Tokens.
YOU MUST use all the frontend and backend dependencies with a package manager.
For the frontend use one of the following:
VanillaJS, take advantage of the new EcmaScript functionalities.
Use some of the frontend frameworks listed in the 2017 state of javascript.
Use some of the programming languages that transpiles to javascript.
You COULD use a CSS framework like bootstrap or foundation, but it’ll be great if you implement a CSS preprocessor.
All the source code MUST use a formating style (eslint, editorconfig).
Consider the following things for the creation of the blog:

Only registered users can publish.
Anyone can see the publications.
Only registered users can add comments to the publications.
Publications must have a category.
All the source code must be versioned using a public git repository in GitHub or GitLab.
