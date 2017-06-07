defmodule MysteryNight.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :first_name, :string
      add :last_name, :string
      add :email, :string
      add :password, :string
      add :type, :string
      add :super_admin, :boolean, default: false, null: false

      timestamps()
    end

  end
end
