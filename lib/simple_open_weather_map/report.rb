
class SimpleOpenWeatherMap::Report
    attr_accessor :config, :city_id

    def initialize(config)
      if config.is_a?(Hash) then
        @config = SimpleOpenWeatherMap::Config.new(config)
      elsif config.is_a?(SimpleOpenWeatherMap::Config) then
        @config = config
      else
        raise "config should be Hash or SimpleOpenWeatherMap::Config object."
      end
    end

    public

    def current
        weather.current(@config)
    end

    def forecast
        weather.forecast(@config)
    end

    def puts_report
      puts format_current(current)
      puts ""

      cnt = 0
      forecast["list"].each do |data|
        if cnt != 0 then
          puts format_forecast(data)
        end

        cnt += 1
      end
    end

    private

    def weather
        @weather = @weather || SimpleOpenWeatherMap::Weather.new
    end

    def format_current(data)
      # temp main, description :name
      "%d°C %s, %s :%s" % [
          data["main"]["temp"],
          data["weather"][0]["main"],
          data["weather"][0]["description"],
          data["name"]
      ]
    end

    def format_forecast(data)
      # day temp-min - temp.max description
      "%-4s\t\t%2d°C - %2d°C\t\t%s" % [
          ::Time.at(data["dt"]).strftime("%a"),
          data["temp"]["min"],
          data["temp"]["max"],
          data["weather"][0]["description"]
      ]
    end
end
