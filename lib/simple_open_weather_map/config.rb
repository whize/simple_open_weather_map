

class SimpleOpenWeatherMap::Config
  attr_accessor :app_id, :unit, :forecast_days, :save_icon_dir, :city_id

  def initialize(config = {})
    raise "Hash only." unless config.is_a?(Hash)

    validate(config)
    parse(default_config.merge(config))
  end

  def save_icon?
    @save_icon || false
  end

  protected

  def default_config
    {
      city_id: 1850147,
      unit: "metric",
      forecast_days: 7,
      save_icon: true,
      save_icon_dir: "/tmp",
    }
  end

  def parse(config = {})
    config.each_key do | key |
      case key
      when :app_id then
          @app_id = config[:app_id]
      when :city_id then
          @city_id = config[:city_id]
      when :unit then
          @unit = config[:unit]
      when :forecast_days then
          @forecast_days = config[:forecast_days]
      when :save_icon then
          @save_icon = config[:save_icon]
      when :save_icon_dir then
          @save_icon_dir = config[:save_icon_dir]
      end
    end
  end

  private

  def mandatory_key
    [:app_id, :city_id]
  end

  def validate(config = {})
      raise ArgumentError.new("Value of app_id key is mandatory.") unless config.has_key?(:app_id)
      # raise ArgumentError.new("Value of city_id key is mandatory") unless config.has_key?(:city_id)
  end

end
