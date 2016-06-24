
# Slack::Peoplepuller

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/slack/peoplepuller`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'slack-peoplepuller'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install slack-peoplepuller

## Usage

```ruby
Slack::Peoplepuller.configure do |config|
  config.slack_api_token = ENV['SLACK_API_TOKEN']
  config.groups = ['Group Name', 'Other Group Name']
end
people = Slack::Peoplepuller.pull
# [{:name=>"John Smith", :image=>"http://foo.com/image.jpg", :title=>"Manager"}, {:name=>"Jane Doe", :image=>"http://bar.com/image.png", :title=>"Developer"}]

```
## Development

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/slack-peoplepuller.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

