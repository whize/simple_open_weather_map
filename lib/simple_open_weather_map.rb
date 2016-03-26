require "simple_open_weather_map/version"
require 'simple_open_weather_map/config'
require 'simple_open_weather_map/report'
require 'simple_open_weather_map/weather'
require 'simple_open_weather_map/http_connection'

module SimpleOpenWeatherMap
  #
  # OpenWeatherMap API URL
  #
  BASE_URL = 'http://api.openweathermap.org/data/2.5'.freeze

  #
  # Weather icon url template.
  # You must bind icon name into this strings.
  #
  ICON_URL_TEMPLATE = 'http://openweathermap.org/img/w/%s.png'.freeze

  #
  # Url path for current
  #
  PATH_CURRENT = '/weather'.freeze

  #
  # Url path for forecast daily
  #
  PATH_FORECAST = '/forecast/daily'.freeze

  #
  # Parameter value for unit (kelvin)
  #
  UNIT_KELVIN = 'kelvin'.freeze

  #
  # Parameter value for unit (metric)
  #
  UNIT_METRIC = 'metric'.freeze

  #
  # Default number of days to get forecast. 7 days
  #
  FORECAST_DAYS = 7
end
