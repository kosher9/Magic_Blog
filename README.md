# Magic_BLog

## Built With

- Ruby on Rails
- PostgreSQL

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

- [Ruby](https://www.ruby-lang.org/en/)
- [Rails](https://gorails.com/)

### Setup

- Make sure you have Ruby on Rails set up properly on your computer
- Clone or download this repo on your machine
- Enter project directory

### Development Database

```sh
# Create user
sudo -u postgres createuser -e ced00 -s
# Load the schema
rails db:schema:load
#----- If you want prefer this approach
# Create the database
rake db:create
# Create database Migration
rails db:migrate
```

### Install

```sh
bundle install
```

### Run

```sh
rails s
```

### Test

```sh
rspec
```

## Authors

👤 **Cédric Kossi**

- GitHub: [@kosher9](https://github.com/kosher9)
- Twitter: [@kosherus](https://twitter.com/kosherus)
- LinkedIn: [LinkedIn](https://linkedin.com/in/lionel-c%C3%A9dric-kossi-323042172)
