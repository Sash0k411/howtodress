class WeatherCache
  require 'httparty'

  LOCATION_KEY = "294021".freeze
  private_constant :LOCATION_KEY

  def self.download
    new.download
  end

  def download
    parsed_response["DailyForecasts"].each do |daily_forecast|
      city = LOCATION_KEY
      temperature_min = daily_forecast["Temperature"]["Minimum"]["Value"]
      temperature_max = daily_forecast["Temperature"]["Maximum"]["Value"]
      condition = daily_forecast["Day"]["IconPhrase"]

      Weather.create!(
        city: city,
        temperature_min: temperature_min,
        temperature_max: temperature_max,
        condition: condition
      )
    end
  end

  private

  def api_url
    "#{ENV["BASE_URL"]}/forecasts/v1/daily/1day/#{LOCATION_KEY}"
  end

  def parsed_response
    @parsed_response ||= HTTParty.get(api_url, query: { apikey: ENV["ACCUWEATHER_API_KEY"] }).parsed_response
  end

end