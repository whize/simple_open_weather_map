require 'uri'
require 'httpclient'

class SimpleOpenWeatherMap::HttpConnection

  def initialize(uri)
    @uri = uri
  end

  def get_contents(params = {})
    client = ::HTTPClient.new
    client.get_content(url_with_params(params))
  end

  protected

  def url_with_params(params = {})
    encoded_params = URI.encode_www_form(params)
    [@uri, encoded_params].join("?")
  end

end
