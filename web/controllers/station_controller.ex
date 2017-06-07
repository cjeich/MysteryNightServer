defmodule MysteryNight.StationController do
  use MysteryNight.Web, :controller

  alias MysteryNight.Station

  def index(conn, _params) do
    stations = Repo.all(Station)
    render(conn, "index.html", stations: stations)
  end

  def new(conn, _params) do
    changeset = Station.changeset(%Station{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"station" => station_params}) do
    changeset = Station.changeset(%Station{}, station_params)

    case Repo.insert(changeset) do
      {:ok, _station} ->
        conn
        |> put_flash(:info, "Station created successfully.")
        |> redirect(to: station_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    station = Repo.get!(Station, id)
    render(conn, "show.html", station: station)
  end

  def edit(conn, %{"id" => id}) do
    station = Repo.get!(Station, id)
    changeset = Station.changeset(station)
    render(conn, "edit.html", station: station, changeset: changeset)
  end

  def update(conn, %{"id" => id, "station" => station_params}) do
    station = Repo.get!(Station, id)
    changeset = Station.changeset(station, station_params)

    case Repo.update(changeset) do
      {:ok, station} ->
        conn
        |> put_flash(:info, "Station updated successfully.")
        |> redirect(to: station_path(conn, :show, station))
      {:error, changeset} ->
        render(conn, "edit.html", station: station, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    station = Repo.get!(Station, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(station)

    conn
    |> put_flash(:info, "Station deleted successfully.")
    |> redirect(to: station_path(conn, :index))
  end
end
