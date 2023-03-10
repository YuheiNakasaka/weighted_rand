# WeightedRand

This gem provides a method to select a element by weighted randomization from a hash with weights.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'weighted_rand'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install weighted_rand

## Usage

- Prepare for weights with hash formats.
- Initialize class and pass the weights to `#new` args.
- Call `#sample`.

### Linear

```
weights = {'a' => 1, 'b' => 2, 'c' => 3}
weighted_rand = WeightedRand::Linear.new(weights)
weighted_rand.sample #=> c > b > a
```

### BinarySearch

```
weights = {'a' => 1, 'b' => 2, 'c' => 3}
weighted_rand = WeightedRand::BinarySearch.new(weights)
weighted_rand.sample #=> c > b > a
```

### Walker's Alias

- [Alias method](https://en.wikipedia.org/wiki/Alias_method)

```
weights = {'a' => 1, 'b' => 2, 'c' => 3}
weighted_rand = WeightedRand::WalkerAlias.new(weights)
weighted_rand.sample #=> c > b > a
```

## Performance

- Comparison of Linear/BinarySearch/WalkerAlias/[WeightedRandomizer](https://github.com/ryanlecompte/weighted_randomizer)
- weights size: 10,000

| Repeat  |  Linear | BinarySearch | WalkerAlias | WeightedRandomizer |
| ------- | ------: | -----------: | ----------: | -----------------: |
| 1       | 0.0014s |      0.0013s |     0.0037s |            0.0032s |
| 10      | 0.0043s |      0.0014s |     0.0038s |            0.0052s |
| 100     | 0.0299s |      0.0016s |     0.0043s |            0.0369s |
| 1,000   | 0.3192s |      0.0043s |     0.0054s |            0.3408s |
| 10,000  | 3.0431s |      0.0189s |     0.0124s |            3.4284s |
| 100,000 | 30.356s |      0.1575s |     0.0751s |            34.844s |

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also r
un `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Release

```
bundle exec rake build
git push origin <branch>
bundle exec rake release
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/YuheiNakasaka/weighted_rand. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/YuheiNakasaka/weighted_rand/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the WeightedRand project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/YuheiNakasaka/weighted_rand/blob/main/CODE_OF_CONDUCT.md).
