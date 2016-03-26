require 'json'
require 'FileUtils'
require 'open-uri'

class SimpleOpenWeatherMap::Weather

  attr_accessor :icon_path

  def current(config)
    raise "SimpleOpenWeatherMap::Config only!" unless config.is_a?(SimpleOpenWeatherMap::Config)

    responseJson = http_connection(SimpleOpenWeatherMap::PATH_CURRENT).get_contents(current_params(config))
    return nil if responseJson.nil? || responseJson.empty?

    @current = ::JSON.parse(responseJson)

    if config.save_icon? then
      save_current_icon(@current["weather"][0]["icon"], config.save_icon_dir)
    end

    return @current
  end

  def forecast(config)
    raise "SimpleOpenWeatherMap::Config only!" unless config.is_a?(SimpleOpenWeatherMap::Config)

    responseJson = http_connection(SimpleOpenWeatherMap::PATH_FORECAST).get_contents(forecast_params(config))
    return nil if responseJson.nil? || responseJson.empty?

    ::JSON.parse(responseJson)
  end

  protected

  def http_connection(path)
    SimpleOpenWeatherMap::HttpConnection.new(SimpleOpenWeatherMap::BASE_URL + path)
  end

  def current_params(config)
    {
      APPID: config.app_id,
      units: config.unit,
      id:    config.city_id,
    }
  end

  def forecast_params(config)
    {
      APPID: config.app_id,
      units: config.unit,
      id:    config.city_id,
      cnt:   config.forecast_days,
    }
  end

  def save_current_icon(icon_name, dir)
    return nil if icon_name.nil? || icon_name.empty?

    icon_url = SimpleOpenWeatherMap::ICON_URL_TEMPLATE % [icon_name]
    @icon_path = "%s/%s" % [dir, "weather_icon.png"]

    ::FileUtils.mkdir_p(dir) unless ::FileTest.exist?(dir)

    open(@icon_path, 'wb') do |output|
      open(icon_url) do |data|
        output.write(data.read)
      end
    end

  end

end
