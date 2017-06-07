defmodule MysteryNight.StationTest do
  use MysteryNight.ModelCase

  alias MysteryNight.Station

  @valid_attrs %{address1: "some content", address2: "some content", city: "some content", clue: "some content", event_id: 42, location_id: 42, name: "some content", notes: "some content", open: true, state: "some content", zip: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Station.changeset(%Station{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Station.changeset(%Station{}, @invalid_attrs)
    refute changeset.valid?
  end
end
