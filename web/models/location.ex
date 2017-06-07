defmodule MysteryNight.Location do
  use MysteryNight.Web, :model

  schema "locations" do
    field :lat, :string
    field :long, :string
    field :velocity, :integer
    field :station_id, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:lat, :long, :velocity, :station_id])
    |> validate_required([:lat, :long, :velocity, :station_id])
  end
end
