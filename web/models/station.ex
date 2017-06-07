defmodule MysteryNight.Station do
  use MysteryNight.Web, :model

  schema "stations" do
    field :name, :string
    field :address1, :string
    field :address2, :string
    field :city, :string
    field :state, :string
    field :zip, :string
    field :event_id, :integer
    field :location_id, :integer
    field :open, :boolean, default: false
    field :notes, :string
    field :clue, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :address1, :address2, :city, :state, :zip, :event_id, :location_id, :open, :notes, :clue])
    |> validate_required([:name, :address1, :address2, :city, :state, :zip, :event_id, :location_id, :open, :notes, :clue])
  end
end
