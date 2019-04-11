defmodule Weather.CLI do
  @moduledoc """
  Handle the command line parsing and the dispatch to
  the various functions that end up generating a 
  weather report
  """

  def main(argv) do
    argv
    |> parse_args
    |> process
  end

  @doc """
  `argv` can be -h or --help, which returns :help.
  Otherwise it is a city, lat and long or zip code.
  Returns a tuple of `{city}`, `{lat, long}`, `{zip_code}` or
  `:help` if -h was given.
  """

  def parse_args(argv) do
    parse =
      OptionParser.parse(
        argv,
        switches: [help: :boolean, city: :boolean, lat_long: :boolean, zip_code: :boolean],
        aliases: [h: :help, c: :city, l: :lat_long, z: :zip_code]
      )

    case parse do
      {[help: true], _, _} ->
        :help

      {[city: true], [city], _} ->
        {city}

      {[lat_long: true], [lat, long], _} ->
        {String.to_float(lat), String.to_float(long)}

      {[zip_code: true], [zip_code], _} ->
        {zip_code}

      _ ->
        :help
    end
  end

  def process(:help) do
    IO.puts("""
    usage: weather <city> / <lat> <long> / <zip_code>
    """)
  end

  def process(:city, {city}) do
    Weather.FetchData.fetch(city)
  end

  def process({city}) do
    IO.puts("CITY")
  end

  def process({lat, long}) do
    IO.puts("LAT LONG")
  end

  def process({zip_code}) do
    IO.puts("ZIP CODE")
  end
end
