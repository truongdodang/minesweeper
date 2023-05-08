# Minesweeper Board Generator

A simple project to generate and manage minesweeper boards.
Inputting the creator's email, board name, width, height, and number of mines to generate a board.
Then you can view the board in detail as a matrix with some random mines within.
Also, you can delete a board, and view all or recently generated boards.

<br>

## Getting Started

### Prerequisites

The setups steps expect following libraries/ tools installed on your system.

- Github
- Ruby [3.2.1]
- Rails [7.0.4]
- Bundler [2.4.10]
- PostgreSQL

### Codebase Setup

Check out the repository
```
git clone git@github.com:organization/project-name.git
```

Go to the repository
```
cd mimesweeper
```

Install gems
```
bundle install
```

### Database Setup

Open database config file `config/database.yml` and update what you like.

Create and migrate database
```
rails db:create
rails db:migrate
```

### Build

You can enable caching on development mode by command
```
rails dev:cache
```

Compile assets
```
./bin/dev
```

### Tests
Run and check unit tests
```
bundle exec rspec
```

### Start local server
```
rails s
```

Then you can visit the site with the URL http://localhost:3000

### Built With
- [Rails 7](https://guides.rubyonrails.org/) - Backend / Frontend
- [PostgreSQL](https://www.postgresql.org/) - Database
- [TailwindCSS](https://tailwindcss.com/) — Styling
- [Font Awesome](https://fontawesome.com/) — Font style
- [RSpec](https://rspec.info/) — Testing
- [Heroku](https://heroku.com/) - Deployment

### Contributing
Pull requests are welcome.
