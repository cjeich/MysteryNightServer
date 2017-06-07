defmodule MysteryNight.TeamTest do
  use MysteryNight.ModelCase

  alias MysteryNight.Team

  @valid_attrs %{driver_id: 42, name: "some content", points: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Team.changeset(%Team{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Team.changeset(%Team{}, @invalid_attrs)
    refute changeset.valid?
  end
end
