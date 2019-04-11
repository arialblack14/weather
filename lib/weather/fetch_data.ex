defmodule Weather.FetchData do
  require Logger

  def fetch(city) do
    Logger.info("Fetching weather data for #{city}")
  end
end
