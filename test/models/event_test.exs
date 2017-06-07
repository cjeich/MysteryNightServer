defmodule MysteryNight.EventTest do
  use MysteryNight.ModelCase

  alias MysteryNight.Event

  @valid_attrs %{date: %{day: 17, month: 4, year: 2010}, description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Event.changeset(%Event{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Event.changeset(%Event{}, @invalid_attrs)
    refute changeset.valid?
  end
end
