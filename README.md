# Dotenv Heroku

Support for config push and pull via Rake tasks for
[dotenv](https://github.com/bkeepers/dotenv). The rake tasks rely on the
`heroku` excutable to be present in the PATH.

## Installation

Add this line to your application's Gemfile:

    gem 'dotenv-heroku'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dotenv-heroku

## Usage

Add

    require "dotenv-heroku/tasks"

to your Rakefile.

You can now run

    $ rake config:pull

to pull the current heroku config to the local .env file, you can also pass the
desired file as an argument

    $ rake config:pull\[my_current_config\]

You can also push the config to heroku via

    $ rake config:push

to push the config from the .env file, or

    $ rake config:push\[my_current_config\]

to push the config from the my_current_config file

## Contributing

1. Fork it ( https://github.com/[my-github-username]/dotenv-heroku/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
