defmodule Splurty.SplurtyDB.Quote do
  use Ecto.Schema
  import Ecto.Changeset

  schema "quotes" do
    field :author, :string
    field :saying, :string

    timestamps()
  end

  @doc false
  def changeset(quote, attrs \\ %{}) do
    quote
    |> cast(attrs, [:saying, :author])
    |> validate_required([:saying])
    |> unique_constraint(:saying)
  end
end
