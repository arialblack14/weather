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

  @weather_url Application.get_env(:weather, :weather_url)

  defp city_url(city) do
    appid = System.get_env("OPEN_WEATHER_APPID")
    "#{@weather_url}/forecast?q=#{city}&appid=#{appid}"
  end

  defp handle_response(response) do
    case response do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, body}

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {:ok, "Not found..."}

      {:ok, %HTTPoison.Response{status_code: _}} ->
        {:ok, "Invalid status code.''"}

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end
end
