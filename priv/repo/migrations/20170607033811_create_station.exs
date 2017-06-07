defmodule MysteryNight.Repo.Migrations.CreateStation do
  use Ecto.Migration

  def change do
    create table(:stations) do
      add :name, :string
      add :address1, :string
      add :address2, :string
      add :city, :string
      add :state, :string
      add :zip, :string
      add :event_id, :integer
      add :open, :boolean, default: false, null: false
      add :notes, :string
      add :clue, :string

      timestamps()
    end

  end
end
