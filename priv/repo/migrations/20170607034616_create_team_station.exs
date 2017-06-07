defmodule MysteryNight.Repo.Migrations.CreateTeamStation do
  use Ecto.Migration

  def change do
    create table(:team_stations) do
      add :completed, :boolean, default: false, null: false
      add :team_id, :integer
      add :station_id, :boolean, default: false, null: false
      add :points_earned, :integer
      add :identified, :boolean, default: false, null: false

      timestamps()
    end

  end
end
