# Ispmail::On::Rails

This is a Ruby on Rails application to manage ISPMAIL:
https://workaround.org/ispmail/jessie

See ringe/ansible-ispmail-jessie for installation with Ansible.

## Requirements

You need MySQL to run this app. To run in production, have a look at the links above.

## Installation

Unpack this gem in you destination folder, for instance

    $ cd /var/www
    $ gem unpack ispmail-on-rails

Add .env file with the following contents:

    DB_USER=root
    DB_PASSWORD=

And then execute:

    $ ./bin/setup

## Usage

    $ bundle exec rails server

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ringe/ispmail-on-rails.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

