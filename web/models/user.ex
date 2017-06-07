defmodule MysteryNight.User do
  use MysteryNight.Web, :model

  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :password, :string
    field :type, :string
    field :super_admin, :boolean, default: false

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:first_name, :last_name, :email, :password, :type, :super_admin])
    |> validate_required([:first_name, :last_name, :email, :password, :type, :super_admin])
  end
end
