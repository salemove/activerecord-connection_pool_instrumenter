# Activerecord::ConnectionPoolInstrumenter

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activerecord-connection_pool_instrumenter'
```

And then execute `bundle install`

## Usage

Include in your application:

```
require 'activerecord/connection_pool_instrumenter'
Activerecord::ConnectionPoolInstrumenter.instrument(statsd: statsd, prefix: 'your_app.db.connection_pool')
```

## Development

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/salemove/activerecord-connection_pool_instrumenter.

