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
    IO.puts(argv)

    parse =
      OptionParser.parse(
        argv,
        switches: [help: :boolean, city: :boolean, latlong: :boolean, zipcode: :boolean],
        aliases: [h: :help, c: :city, l: :latlong, z: :zipcode]
      )

    case parse do
      {[help: true], _, _} ->
        :help

      {[latlong: true], [lat, long], _} ->
        {String.to_float(lat), String.to_float(long)}

      {[city: true], [city], _} ->
        {city}

      {[zipcode: true], [zip_code], _} ->
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

  def process({city}) do
    Weather.FetchData.fetch_by_city(city)
  end

  def process({lat, long}) do
    Weather.FetchData.fetch_by_latlong(lat, long)
  end

  def process({zip_code}) do
    Weather.FetchData.fetch_by_zipcode(zip_code)
  end
end
