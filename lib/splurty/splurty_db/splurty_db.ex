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

  def get_quote!(id), do: Repo.get!(Quote, id)

  def update_quote(%Quote{}, attrs) do
    %Quote{}
    |> Quote.changeset(attrs)
    |> Repo.update()
  end
end
