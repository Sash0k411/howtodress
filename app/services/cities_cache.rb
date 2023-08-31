class CitiesCache

  def self.download
    new.download
  end

  def download

  end

  private

  def api_url
    "#{ENV["BASE_URL"]}/locations/v1//v1/topcities/150"
  end

  def parsed_response
    @parsed_response ||= HTTParty.get(api_url, query: { apikey: ENV("ACCUWEATHER_API_KEY") }).parsed_response
  end
end