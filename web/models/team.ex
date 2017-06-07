defmodule MysteryNight.Team do
  use MysteryNight.Web, :model

  schema "teams" do
    field :name, :string
    field :points, :integer
    field :driver_id, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :points, :driver_id])
    |> validate_required([:name, :points, :driver_id])
  end
end
