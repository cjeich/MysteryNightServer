defmodule MysteryNight.TeamStation do
  use MysteryNight.Web, :model

  schema "team_stations" do
    field :completed, :boolean, default: false
    field :team_id, :integer
    field :station_id, :boolean, default: false
    field :points_earned, :integer
    field :identified, :boolean, default: false

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:completed, :team_id, :station_id, :points_earned, :identified])
    |> validate_required([:completed, :team_id, :station_id, :points_earned, :identified])
  end
end
