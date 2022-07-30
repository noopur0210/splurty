defmodule Splurty.SplurtyDb do
  alias Splurty.Repo
  alias Splurty.SplurtyDB.Quote

  def list_quotes do
    Repo.all(Quote)
  end

  def change_quote(%Quote{} = q) do
    Quote.changeset(q)
  end

  def create_quote(attrs \\ %{}) do
    %Quote{}
    |> Quote.changeset(attrs)
    |> Repo.insert()
  end

  def get_room!(id), do: Repo.get!(Quote, id)

end
