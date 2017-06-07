defmodule MysteryNight.StationControllerTest do
  use MysteryNight.ConnCase

  alias MysteryNight.Station
  @valid_attrs %{address1: "some content", address2: "some content", city: "some content", clue: "some content", event_id: 42, location_id: 42, name: "some content", notes: "some content", open: true, state: "some content", zip: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, station_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing stations"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, station_path(conn, :new)
    assert html_response(conn, 200) =~ "New station"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, station_path(conn, :create), station: @valid_attrs
    assert redirected_to(conn) == station_path(conn, :index)
    assert Repo.get_by(Station, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, station_path(conn, :create), station: @invalid_attrs
    assert html_response(conn, 200) =~ "New station"
  end

  test "shows chosen resource", %{conn: conn} do
    station = Repo.insert! %Station{}
    conn = get conn, station_path(conn, :show, station)
    assert html_response(conn, 200) =~ "Show station"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, station_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    station = Repo.insert! %Station{}
    conn = get conn, station_path(conn, :edit, station)
    assert html_response(conn, 200) =~ "Edit station"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    station = Repo.insert! %Station{}
    conn = put conn, station_path(conn, :update, station), station: @valid_attrs
    assert redirected_to(conn) == station_path(conn, :show, station)
    assert Repo.get_by(Station, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    station = Repo.insert! %Station{}
    conn = put conn, station_path(conn, :update, station), station: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit station"
  end

  test "deletes chosen resource", %{conn: conn} do
    station = Repo.insert! %Station{}
    conn = delete conn, station_path(conn, :delete, station)
    assert redirected_to(conn) == station_path(conn, :index)
    refute Repo.get(Station, station.id)
  end
end
