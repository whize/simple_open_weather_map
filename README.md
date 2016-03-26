# SimpleOpenWeatherMap

A simple ruby language library for the OpenWeatherMap API.
This library doesn't have functions enough to call the OpenWeatherMap API because I basically made this to display current weather and forecast to my desktop using the GeekTool.
But I think this library helps you to call the OpenWeatherMap API with using or extending Openweathermap::Weather class.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simple_open_weather_map'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_open_weather_map

## Usage

```ruby
require 'simple_open_weather_map'

conf = simple_open_weather_map::Config({
  app_id: "your APPID",        # Get from OpenWeatherMap.org",
  city_id: 1234,               # integer: specify city id.
  unit: "metric",              # metric or kelvin. Default: metric
  save_icon: true,             # if you set true, you have to specify save_icon_dir. Default: true
  save_icon_dir: "~/Pictures", # Specify directory path to save weather icon. Default: /tmp
  forecast_days: 7,            # Specify number of days to get forecast. Default: 7
})
weather = simple_open_weather_map::Weather.new
current = weather.current(conf) # returns json formatted content.
forecast = weather.forecast(conf) # returns json formatted content.
icon_path = weather.icon_path # returns path of current weather icon.
```

See the following site about json response.

* [current](http://openweathermap.org/current#current_JSON)
* [forecast](http://openweathermap.org/forecast16#JSON)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/whize/simple_open_weather_map. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
