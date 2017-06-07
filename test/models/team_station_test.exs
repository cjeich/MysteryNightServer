defmodule MysteryNight.TeamStationTest do
  use MysteryNight.ModelCase

  alias MysteryNight.TeamStation

  @valid_attrs %{completed: true, identified: true, points_earned: 42, station_id: true, team_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = TeamStation.changeset(%TeamStation{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = TeamStation.changeset(%TeamStation{}, @invalid_attrs)
    refute changeset.valid?
  end
end
