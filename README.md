# Weather

This is a simple CLI programm to fetch data from the `openweathermap.org` api.
You will need an API key to run this. Place it in your `.env` file.

## Available options

`-h` or `--help` for usage tips.

`-c` or `--city` to receive weather data by city.

`-l` or `--latlong` to receive weather data by latitude and longitude.

`-z` or `--zipcode` to receive weather data by zipcode.


## Run with mix

e.g.

Get the weather in Athens, Greece.
`mix run -e 'Weather.CLI.main(["--city", "Athens, GR"])'`

`mix run -e 'Weather.CLI.main(["-l", "37.44529", "25.32872"])'`

Get the weather in 

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `weather` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:weather, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/weather](https://hexdocs.pm/weather).

