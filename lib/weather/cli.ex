defmodule Weather.CLI do
  @moduledoc """
  Handle the command line parsing and the dispatch to
  the various functions that end up generating a 
  weather report
  """

  def run(argv) do
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
        ["-h", "-c", "-l", "-z"],
        switches: [help: :boolean, city: :string, lat_long: :string, zip_code: :string],
        aliases: [h: :help, c: :city, l: :lat_long, z: :zip_code]
      )

    case parse do
      {[help: true], _, _} ->
        :help

      {[city: true], _, _} ->
        :city

      {[lat_long: true], _, _} ->
        :lat_long

      {[zip_code: true], _, _} ->
        :zip_code

      # {_, [city], _} ->
      #   {city}

      # {_, [lat, long], _} ->
      #   {lat, long}

      # {_, [zip_code], _} ->
      #   {zip_code}

      _ ->
        :help
    end
  end

  def process(:help) do
    IO.puts("""
    usage: weather <city> / <lat> <long> / <zip_code>
    """)
  end

  def process(:city) do
    IO.puts("""
    usage: weather <city> / <lat> <long> / <zip_code>
    """)
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
