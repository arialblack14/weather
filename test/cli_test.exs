defmodule CliTest do
  use ExUnit.Case

  import Weather.CLI, only: [parse_args: 1]

  test ":help returned by option parsing with -h and --help options" do
    assert parse_args(["-h", "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
  end

  test ":city returned by option parsing with -c and --city options" do
    assert parse_args(["-c", "London"]) == {"London"}
    assert parse_args(["--city", "London"]) == {"London"}
  end

  test ":zipcode returned by option parsing with -z and --zipcode options" do
    assert parse_args(["-z", "90210"]) == {"90210"}
    assert parse_args(["--zipcode", "90210"]) == {"90210"}
  end

  test "lat and long returned if -l and --latlong passed" do
    assert parse_args(["-l", "99.9999", "99.9999"]) == {99.9999, 99.9999}
    assert parse_args(["--latlong", "99.9999", "99.9999"]) == {99.9999, 99.9999}
  end
end
