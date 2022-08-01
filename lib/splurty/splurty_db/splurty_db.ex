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

  def update_quote(%Quote{} = q, attrs) do
    q
    |> Quote.changeset(attrs)
    |> Repo.update()
  end

  def delete_quote(%Quote{} = q), do: Repo.delete(q)

  def get_random do
    query = Ecto.Adapters.SQL.query(Splurty.Repo,
      "SELECT id FROM quotes ORDER BY RANDOM() LIMIT 1"
    )
    {:ok, %Postgrex.Result{rows: [[id]]}} = query
    get_quote!(id)
  end
end
