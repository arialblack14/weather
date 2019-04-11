defmodule Weather.FetchData do
  require Logger

  def fetch_by_city(city) do
    Logger.info("Fetching weather data for #{city}")

    city_url(city)
    |> HTTPoison.get()
    |> handle_response
  end

  def fetch_by_latlong(lat, long) do
    Logger.info("Fetching weather data for lat: #{lat} and long: #{long}")
  end

  def fetch_by_zipcode(zip_code) do
    Logger.info("Fetching weather data for zipcode: #{zip_code}")
  end

  defp city_url(city) do
    appid = System.get_env("OPEN_WEATHER_APPID")
    "api.openweathermap.org/data/2.5/forecast?q=#{city}&appid=#{appid}"
  end

  defp handle_response(%{status: 200, body: body}), do: {:ok, body}
  defp handle_response(%{status: _, body: body}), do: {:error, body}
end
