# Minesweeper Board Generator

A simple project to generate and manage minesweeper boards.
Inputting the creator's email, board name, width, height, and number of mines to generate a board.
Then you can view the board in detail as a matrix with some random mines within.
Also, you can delete a board, and view all or recently generated boards.

<br>

<img width="954" alt="Screenshot 2023-05-08 at 16 44 49" src="https://user-images.githubusercontent.com/7007742/236814475-6650eb78-824b-40d2-ada3-e2a416194436.png">

<img width="963" alt="Screenshot 2023-05-08 at 16 45 15" src="https://user-images.githubusercontent.com/7007742/236814435-9d7c1e26-b9ca-4a26-a486-94854c8a0a03.png">

<img width="954" alt="Screenshot 2023-05-08 at 16 44 15" src="https://user-images.githubusercontent.com/7007742/236814506-a095c3c1-7b6e-4471-a6ab-13d9652ba4f0.png">

<img width="951" alt="Screenshot 2023-05-08 at 16 44 04" src="https://user-images.githubusercontent.com/7007742/236814534-9269542b-7c70-4522-ad16-edbe0def376c.png">


Demo here: https://truong-minesweeper.herokuapp.com

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
git clone git@github.com:truongdodang/minesweeper.git
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
