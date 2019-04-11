defmodule Weather.FetchData do
  require Logger

  def fetch_by_city(city) do
    Logger.info("Fetching weather data for #{city}")
  end

  def fetch_by_latlong(lat, long) do
    Logger.info("Fetching weather data for lat: #{lat} and long: #{long}")
  end

  def fetch_by_zipcode(zip_code) do
    Logger.info("Fetching weather data for zipcode: #{zip_code}")
  end
end
