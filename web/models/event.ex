defmodule MysteryNight.Event do
  use MysteryNight.Web, :model

  schema "events" do
    field :date, Ecto.Date
    field :name, :string
    field :description, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:date, :name, :description])
    |> validate_required([:date, :name, :description])
  end
end
