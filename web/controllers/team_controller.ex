defmodule MysteryNight.TeamController do
  use MysteryNight.Web, :controller

  alias MysteryNight.Team

  def index(conn, %{"event_id" => event_id}) do
    event = Repo.get!(Event, event_id)
    teams = Repo.all(Team)
    render(conn, "index.html", teams: teams)
  end

  def new(conn, %{"event_id" => event_id}) do
    event = Repo.get!(Event, event_id)
    changeset = Team.changeset(%Team{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"team" => team_params, "event_id" => event_id}) do
    changeset = Team.changeset(%Team{}, team_params)
    event = Repo.get!(Event, event_id)

    case Repo.insert(changeset) do
      {:ok, _team} ->
        conn
        |> put_flash(:info, "Team created successfully.")
        |> redirect(to: event_team_path(conn, :index, event))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    team = Repo.get!(Team, id)
    render(conn, "show.html", team: team)
  end

  def edit(conn, %{"id" => id, "event_id" => event_id}) do
    team = Repo.get!(Team, id)
    event = Repo.get!(Event, event_id)
    changeset = Team.changeset(team)
    render(conn, "edit.html", team: team, changeset: changeset)
  end

  def update(conn, %{"id" => id, "team" => team_params}) do
    team = Repo.get!(Team, id)
    changeset = Team.changeset(team, team_params)

    case Repo.update(changeset) do
      {:ok, team} ->
        conn
        |> put_flash(:info, "Team updated successfully.")
        |> redirect(to: event_team_path(conn, :show, team))
      {:error, changeset} ->
        render(conn, "edit.html", team: team, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id, "event_id" => event_id}) do
    team = Repo.get!(Team, id)
    event = Repo.get!(Event, event_id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(team)

    conn
    |> put_flash(:info, "Team deleted successfully.")
    |> redirect(to: event_team_path(conn, :index, event))
  end
end
