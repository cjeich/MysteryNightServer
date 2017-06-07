defmodule MysteryNight.LocationTest do
  use MysteryNight.ModelCase

  alias MysteryNight.Location

  @valid_attrs %{lat: "some content", long: "some content", station_id: 42, velocity: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Location.changeset(%Location{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Location.changeset(%Location{}, @invalid_attrs)
    refute changeset.valid?
  end
end
