defmodule MysteryNight.Repo.Migrations.CreateTeam do
  use Ecto.Migration

  def change do
    create table(:teams) do
      add :name, :string
      add :points, :integer
      add :driver_id, :integer

      timestamps()
    end

  end
end
