defmodule MysteryNight.Repo.Migrations.CreateLocation do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :lat, :string
      add :long, :string
      add :velocity, :integer
      add :station_id, :integer

      timestamps()
    end

  end
end
