# Price

Welcome to price! Price allows you to check cryptocurrency prices
right from your terminal.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'price'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install price

## Usage

__Basic usage:__

```
$ price
```

__Additional usage:__

This will show a live version of prices

```
$ price --live
```


and this will show the top 20 most popular coins

```
$ price -l 20
```

## Development

After checking out the repo, run `bundle` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cbrnrd/price.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
